; DESCRIPTION: Creates a black rectangular region at (26, 133) spanning 50 by 117 pixels.
; PLAN: r0=26(x), r1=133(y), r2=50(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 133
LDI r2, 50
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
