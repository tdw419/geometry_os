; DESCRIPTION: Creates a purple rectangular region at (138, 129) spanning 22 by 81 pixels.
; PLAN: r0=138(x), r1=129(y), r2=22(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 129
LDI r2, 22
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
