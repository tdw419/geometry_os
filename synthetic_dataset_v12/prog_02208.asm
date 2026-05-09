; DESCRIPTION: Creates a purple rectangular region at (6, 47) spanning 54 by 109 pixels.
; PLAN: r0=6(x), r1=47(y), r2=54(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 47
LDI r2, 54
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
