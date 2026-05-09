; DESCRIPTION: Places a green 26x54 rectangle at position (132, 24).
; PLAN: r0=132(x), r1=24(y), r2=26(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 24
LDI r2, 26
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
