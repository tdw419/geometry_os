; DESCRIPTION: Creates a black rectangular region at (92, 127) spanning 110 by 48 pixels.
; PLAN: r0=92(x), r1=127(y), r2=110(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 127
LDI r2, 110
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
