; DESCRIPTION: Places a purple 95x11 rectangle at position (223, 159).
; PLAN: r0=223(x), r1=159(y), r2=95(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 159
LDI r2, 95
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
