; DESCRIPTION: Places a purple 69x98 rectangle at position (223, 149).
; PLAN: r0=223(x), r1=149(y), r2=69(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 149
LDI r2, 69
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
