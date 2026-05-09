; DESCRIPTION: Places a yellow 12x68 rectangle at position (172, 149).
; PLAN: r0=172(x), r1=149(y), r2=12(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 149
LDI r2, 12
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
