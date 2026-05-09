; DESCRIPTION: Creates a black rectangular region at (149, 146) spanning 93 by 107 pixels.
; PLAN: r0=149(x), r1=146(y), r2=93(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 146
LDI r2, 93
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
