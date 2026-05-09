; DESCRIPTION: Renders a purple box of size 44x76 starting at (207, 20).
; PLAN: r0=207(x), r1=20(y), r2=44(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 20
LDI r2, 44
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
