; DESCRIPTION: Creates a blue rectangular region at (169, 186) spanning 112 by 28 pixels.
; PLAN: r0=169(x), r1=186(y), r2=112(width), r3=28(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 186
LDI r2, 112
LDI r3, 28
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
