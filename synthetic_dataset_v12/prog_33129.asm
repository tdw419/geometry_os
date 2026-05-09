; DESCRIPTION: Places a green 90x39 rectangle at position (101, 35).
; PLAN: r0=101(x), r1=35(y), r2=90(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 35
LDI r2, 90
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
