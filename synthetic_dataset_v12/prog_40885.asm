; DESCRIPTION: Renders a blue box of size 29x120 starting at (392, 110).
; PLAN: r0=392(x), r1=110(y), r2=29(width), r3=120(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 110
LDI r2, 29
LDI r3, 120
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
