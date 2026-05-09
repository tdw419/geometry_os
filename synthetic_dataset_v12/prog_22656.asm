; DESCRIPTION: Creates a purple rectangular region at (292, 144) spanning 36 by 24 pixels.
; PLAN: r0=292(x), r1=144(y), r2=36(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 144
LDI r2, 36
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
