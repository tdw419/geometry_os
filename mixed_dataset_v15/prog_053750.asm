; DESCRIPTION: Renders a blue rectangular region spanning 114 by 116 at (331, 152).
; PLAN: r0=331(x), r1=152(y), r2=114(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 152
LDI r2, 114
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
