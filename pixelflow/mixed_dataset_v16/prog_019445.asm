; DESCRIPTION: Creates a black rectangular region at (96, 111) spanning 105 by 120 pixels.
; PLAN: r0=96(x), r1=111(y), r2=105(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 111
LDI r2, 105
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
