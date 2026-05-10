; DESCRIPTION: Creates a blue filled rectangle of size 50x70 starting at (249, 29).
; PLAN: r0=249(x), r1=29(y), r2=50(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 29
LDI r2, 50
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
