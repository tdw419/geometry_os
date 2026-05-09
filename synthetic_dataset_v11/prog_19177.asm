; DESCRIPTION: Creates a purple rectangular region at (95, 160) spanning 25 by 39 pixels.
; PLAN: r0=95(x), r1=160(y), r2=25(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 160
LDI r2, 25
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
