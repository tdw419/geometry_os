; DESCRIPTION: Places a yellow 90x44 rectangle at position (162, 136).
; PLAN: r0=162(x), r1=136(y), r2=90(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 136
LDI r2, 90
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
