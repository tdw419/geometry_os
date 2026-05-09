; DESCRIPTION: Creates a purple rectangular region at (16, 121) spanning 52 by 120 pixels.
; PLAN: r0=16(x), r1=121(y), r2=52(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 121
LDI r2, 52
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
