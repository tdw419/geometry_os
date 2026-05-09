; DESCRIPTION: Composite: . Then Places a magenta dot at position (232, 22). Then Renders a green box of size 57x22 starting at (28, 189).
; PLAN: r0=232(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=28(x), r1=189(y), r2=57(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (232, 22).
; PLAN: r0=232(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 232
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Renders a green box of size 57x22 starting at (28, 189).
; PLAN: r0=28(x), r1=189(y), r2=57(width), r3=22(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 189
LDI r2, 57
LDI r3, 22
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
