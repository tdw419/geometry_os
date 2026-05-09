; DESCRIPTION: Creates a black rectangular region at (106, 98) spanning 93 by 109 pixels.
; PLAN: r0=106(x), r1=98(y), r2=93(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 98
LDI r2, 93
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
