; DESCRIPTION: Creates a black rectangular region at (146, 31) spanning 45 by 96 pixels.
; PLAN: r0=146(x), r1=31(y), r2=45(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 31
LDI r2, 45
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
