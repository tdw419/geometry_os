; DESCRIPTION: Creates a purple rectangular region at (16, 135) spanning 68 by 120 pixels.
; PLAN: r0=16(x), r1=135(y), r2=68(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 135
LDI r2, 68
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
