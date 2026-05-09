; DESCRIPTION: Places a yellow 23x103 rectangle at position (461, 86).
; PLAN: r0=461(x), r1=86(y), r2=23(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 86
LDI r2, 23
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
