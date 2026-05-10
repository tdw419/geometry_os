; DESCRIPTION: Renders a purple box of size 84x21 starting at (72, 229).
; PLAN: r0=72(x), r1=229(y), r2=84(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 229
LDI r2, 84
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
