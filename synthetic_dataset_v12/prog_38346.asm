; DESCRIPTION: Creates a purple rectangular region at (403, 50) spanning 108 by 18 pixels.
; PLAN: r0=403(x), r1=50(y), r2=108(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 50
LDI r2, 108
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
