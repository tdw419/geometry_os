; DESCRIPTION: Creates a purple rectangular region at (416, 90) spanning 60 by 120 pixels.
; PLAN: r0=416(x), r1=90(y), r2=60(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 90
LDI r2, 60
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
