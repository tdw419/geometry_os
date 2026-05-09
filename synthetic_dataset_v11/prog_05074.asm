; DESCRIPTION: Places a yellow 60x100 rectangle at position (179, 123).
; PLAN: r0=179(x), r1=123(y), r2=60(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 123
LDI r2, 60
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
