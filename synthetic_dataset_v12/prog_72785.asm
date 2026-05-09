; DESCRIPTION: Creates a green rectangular region at (392, 61) spanning 75 by 80 pixels.
; PLAN: r0=392(x), r1=61(y), r2=75(width), r3=80(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 61
LDI r2, 75
LDI r3, 80
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
