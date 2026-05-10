; DESCRIPTION: Creates a yellow rectangular region at (143, 55) spanning 93 by 117 pixels.
; PLAN: r0=143(x), r1=55(y), r2=93(width), r3=117(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 55
LDI r2, 93
LDI r3, 117
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
