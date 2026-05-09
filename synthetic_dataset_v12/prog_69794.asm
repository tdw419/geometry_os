; DESCRIPTION: Creates a black rectangular region at (448, 3) spanning 16 by 37 pixels.
; PLAN: r0=448(x), r1=3(y), r2=16(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 3
LDI r2, 16
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
