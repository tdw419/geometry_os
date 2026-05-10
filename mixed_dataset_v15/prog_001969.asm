; DESCRIPTION: Creates a purple rectangular region at (50, 103) spanning 85 by 33 pixels.
; PLAN: r0=50(x), r1=103(y), r2=85(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 103
LDI r2, 85
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
