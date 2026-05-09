; DESCRIPTION: Places a green 45x26 rectangle at position (176, 54).
; PLAN: r0=176(x), r1=54(y), r2=45(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 54
LDI r2, 45
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
