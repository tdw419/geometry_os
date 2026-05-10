; DESCRIPTION: Creates a purple rectangular region at (303, 6) spanning 120 by 68 pixels.
; PLAN: r0=303(x), r1=6(y), r2=120(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 6
LDI r2, 120
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
