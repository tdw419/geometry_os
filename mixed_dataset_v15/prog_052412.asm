; DESCRIPTION: Places a purple 103x54 rectangle at position (26, 45).
; PLAN: r0=26(x), r1=45(y), r2=103(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 45
LDI r2, 103
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
