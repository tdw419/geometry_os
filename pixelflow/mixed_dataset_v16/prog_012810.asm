; DESCRIPTION: Renders a purple box of size 52x94 starting at (440, 21).
; PLAN: r0=440(x), r1=21(y), r2=52(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 21
LDI r2, 52
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
