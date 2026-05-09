; DESCRIPTION: Creates a green rectangular region at (146, 54) spanning 70 by 49 pixels.
; PLAN: r0=146(x), r1=54(y), r2=70(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 54
LDI r2, 70
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
