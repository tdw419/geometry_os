; DESCRIPTION: Creates a black rectangular region at (146, 81) spanning 70 by 105 pixels.
; PLAN: r0=146(x), r1=81(y), r2=70(width), r3=105(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 81
LDI r2, 70
LDI r3, 105
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
