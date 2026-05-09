; DESCRIPTION: Renders a purple box of size 105x32 starting at (188, 150).
; PLAN: r0=188(x), r1=150(y), r2=105(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 150
LDI r2, 105
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
