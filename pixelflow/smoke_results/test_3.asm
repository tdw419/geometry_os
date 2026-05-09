; DESCRIPTION: Draws a green rectangle of size 64x64 at the top-left corner (0, 0).
; PLAN: r0=120(x), r1=118(y), r2=184(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 12
LDI r2, 51
LDI r3, 16
LDI r4, 0x00F0FF
RECTF r0, r1, r2, r3, r4
HALT