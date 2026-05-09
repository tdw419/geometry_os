; DESCRIPTION: Places a yellow 85x109 rectangle at position (155, 53).
; PLAN: r0=155(x), r1=53(y), r2=85(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 53
LDI r2, 85
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
