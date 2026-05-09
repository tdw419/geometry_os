; DESCRIPTION: Places a yellow 53x78 rectangle at position (95, 13).
; PLAN: r0=95(x), r1=13(y), r2=53(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 13
LDI r2, 53
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
