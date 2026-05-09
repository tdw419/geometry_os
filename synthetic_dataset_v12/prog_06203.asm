; DESCRIPTION: Creates a yellow rectangular region at (392, 77) spanning 60 by 35 pixels.
; PLAN: r0=392(x), r1=77(y), r2=60(width), r3=35(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 77
LDI r2, 60
LDI r3, 35
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
