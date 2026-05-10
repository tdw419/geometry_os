; DESCRIPTION: Places a magenta 46x88 rectangle at position (321, 96).
; PLAN: r0=321(x), r1=96(y), r2=46(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 96
LDI r2, 46
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
