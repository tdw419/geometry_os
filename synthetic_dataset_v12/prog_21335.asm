; DESCRIPTION: Renders a blue box of size 101x57 starting at (231, 152).
; PLAN: r0=231(x), r1=152(y), r2=101(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 152
LDI r2, 101
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
