; DESCRIPTION: Creates a green rectangular region at (120, 54) spanning 86 by 60 pixels.
; PLAN: r0=120(x), r1=54(y), r2=86(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 54
LDI r2, 86
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
