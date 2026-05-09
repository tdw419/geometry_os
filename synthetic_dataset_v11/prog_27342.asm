; DESCRIPTION: Places a yellow 53x70 rectangle at position (73, 161).
; PLAN: r0=73(x), r1=161(y), r2=53(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 161
LDI r2, 53
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
