; DESCRIPTION: Creates a black rectangular region at (337, 152) spanning 80 by 104 pixels.
; PLAN: r0=337(x), r1=152(y), r2=80(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 152
LDI r2, 80
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
