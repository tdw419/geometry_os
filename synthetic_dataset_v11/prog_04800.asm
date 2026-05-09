; DESCRIPTION: Composite: . Then Renders a red box of size 40x99 starting at (176, 29). Then Places a magenta dot at position (236, 245).
; PLAN: r0=176(x), r1=29(y), r2=40(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=236(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a red box of size 40x99 starting at (176, 29).
; PLAN: r0=176(x), r1=29(y), r2=40(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 29
LDI r2, 40
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (236, 245).
; PLAN: r0=236(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 236
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
