; DESCRIPTION: Renders a purple box of size 79x87 starting at (329, 136).
; PLAN: r0=329(x), r1=136(y), r2=79(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 136
LDI r2, 79
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
