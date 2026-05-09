; DESCRIPTION: Creates a green rectangular region at (120, 132) spanning 32 by 36 pixels.
; PLAN: r0=120(x), r1=132(y), r2=32(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 132
LDI r2, 32
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
