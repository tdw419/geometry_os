; DESCRIPTION: Renders a green box of size 100x62 starting at (251, 152).
; PLAN: r0=251(x), r1=152(y), r2=100(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 152
LDI r2, 100
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
