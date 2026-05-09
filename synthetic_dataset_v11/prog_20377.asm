; DESCRIPTION: Creates a black rectangular region at (185, 90) spanning 16 by 36 pixels.
; PLAN: r0=185(x), r1=90(y), r2=16(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 90
LDI r2, 16
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
