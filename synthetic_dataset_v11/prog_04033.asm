; DESCRIPTION: Creates a purple rectangular region at (12, 204) spanning 45 by 50 pixels.
; PLAN: r0=12(x), r1=204(y), r2=45(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 204
LDI r2, 45
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
