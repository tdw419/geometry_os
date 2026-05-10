; DESCRIPTION: Creates a yellow rectangular region at (461, 133) spanning 50 by 60 pixels.
; PLAN: r0=461(x), r1=133(y), r2=50(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 133
LDI r2, 50
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
