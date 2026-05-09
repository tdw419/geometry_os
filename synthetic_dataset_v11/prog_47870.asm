; DESCRIPTION: Places a yellow 46x119 rectangle at position (208, 109).
; PLAN: r0=208(x), r1=109(y), r2=46(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 109
LDI r2, 46
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
