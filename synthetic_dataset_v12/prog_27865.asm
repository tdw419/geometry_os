; DESCRIPTION: Creates a black rectangular region at (243, 64) spanning 104 by 66 pixels.
; PLAN: r0=243(x), r1=64(y), r2=104(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 64
LDI r2, 104
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
