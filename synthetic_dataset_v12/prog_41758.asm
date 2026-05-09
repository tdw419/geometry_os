; DESCRIPTION: Places a yellow 23x41 rectangle at position (133, 50).
; PLAN: r0=133(x), r1=50(y), r2=23(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 50
LDI r2, 23
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
