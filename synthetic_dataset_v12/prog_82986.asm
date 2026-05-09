; DESCRIPTION: Places a purple 41x54 rectangle at position (254, 63).
; PLAN: r0=254(x), r1=63(y), r2=41(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 63
LDI r2, 41
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
