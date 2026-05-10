; DESCRIPTION: Creates a blue rectangular region at (179, 138) spanning 54 by 36 pixels.
; PLAN: r0=179(x), r1=138(y), r2=54(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 138
LDI r2, 54
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
