; DESCRIPTION: Creates a green rectangular region at (198, 162) spanning 44 by 10 pixels.
; PLAN: r0=198(x), r1=162(y), r2=44(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 162
LDI r2, 44
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
