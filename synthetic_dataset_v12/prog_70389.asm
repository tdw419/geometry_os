; DESCRIPTION: Places a yellow 55x119 rectangle at position (414, 85).
; PLAN: r0=414(x), r1=85(y), r2=55(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 85
LDI r2, 55
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
