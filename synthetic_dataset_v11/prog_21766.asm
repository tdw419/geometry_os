; DESCRIPTION: Creates a blue rectangular region at (82, 133) spanning 85 by 17 pixels.
; PLAN: r0=82(x), r1=133(y), r2=85(width), r3=17(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 133
LDI r2, 85
LDI r3, 17
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
