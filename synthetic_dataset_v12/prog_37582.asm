; DESCRIPTION: Places a yellow 114x70 rectangle at position (169, 112).
; PLAN: r0=169(x), r1=112(y), r2=114(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 112
LDI r2, 114
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
