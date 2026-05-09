; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (15, 33). Then Renders a magenta box of size 59x68 starting at (68, 16).
; PLAN: r0=15(x), r1=33(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=68(x), r1=16(y), r2=59(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (15, 33).
; PLAN: r0=15(x), r1=33(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 15
LDI r1, 33
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a magenta box of size 59x68 starting at (68, 16).
; PLAN: r0=68(x), r1=16(y), r2=59(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 16
LDI r2, 59
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
