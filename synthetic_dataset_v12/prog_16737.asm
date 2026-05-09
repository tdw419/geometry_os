; DESCRIPTION: Creates a black rectangular region at (135, 55) spanning 65 by 107 pixels.
; PLAN: r0=135(x), r1=55(y), r2=65(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 55
LDI r2, 65
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
