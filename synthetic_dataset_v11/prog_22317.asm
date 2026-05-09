; DESCRIPTION: Creates a purple rectangular region at (35, 214) spanning 120 by 41 pixels.
; PLAN: r0=35(x), r1=214(y), r2=120(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 214
LDI r2, 120
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
