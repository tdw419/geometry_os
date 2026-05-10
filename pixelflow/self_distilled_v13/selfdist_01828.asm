; DESCRIPTION: Places a green 53x103 box at position (17, 76).
; PLAN: r0=17(x), r1=76(y), r2=53(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 76
LDI r2, 53
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
