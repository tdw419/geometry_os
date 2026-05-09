; DESCRIPTION: Creates a yellow rectangular region at (74, 82) spanning 120 by 108 pixels.
; PLAN: r0=74(x), r1=82(y), r2=120(width), r3=108(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 82
LDI r2, 120
LDI r3, 108
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
