; DESCRIPTION: Places a green 45x81 rectangle at position (170, 54).
; PLAN: r0=170(x), r1=54(y), r2=45(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 54
LDI r2, 45
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
