; DESCRIPTION: Places a yellow 117x62 rectangle at position (53, 193).
; PLAN: r0=53(x), r1=193(y), r2=117(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 193
LDI r2, 117
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
