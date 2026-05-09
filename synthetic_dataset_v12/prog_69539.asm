; DESCRIPTION: Places a yellow 100x68 rectangle at position (229, 55).
; PLAN: r0=229(x), r1=55(y), r2=100(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 55
LDI r2, 100
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
