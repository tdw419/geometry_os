; DESCRIPTION: Creates a yellow rectangular region at (352, 74) spanning 35 by 47 pixels.
; PLAN: r0=352(x), r1=74(y), r2=35(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 74
LDI r2, 35
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
