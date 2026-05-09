; DESCRIPTION: Places a yellow 26x40 rectangle at position (60, 11).
; PLAN: r0=60(x), r1=11(y), r2=26(width), r3=40(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 11
LDI r2, 26
LDI r3, 40
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
