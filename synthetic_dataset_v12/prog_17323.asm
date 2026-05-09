; DESCRIPTION: Renders a purple box of size 20x77 starting at (440, 161).
; PLAN: r0=440(x), r1=161(y), r2=20(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 161
LDI r2, 20
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
