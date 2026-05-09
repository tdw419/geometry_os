; DESCRIPTION: Places a green 101x26 rectangle at position (102, 84).
; PLAN: r0=102(x), r1=84(y), r2=101(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 84
LDI r2, 101
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
