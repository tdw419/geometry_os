; DESCRIPTION: Renders a blue box of size 50x87 starting at (220, 47).
; PLAN: r0=220(x), r1=47(y), r2=50(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 47
LDI r2, 50
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
