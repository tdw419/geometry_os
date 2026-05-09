; DESCRIPTION: Places a yellow 81x62 rectangle at position (329, 54).
; PLAN: r0=329(x), r1=54(y), r2=81(width), r3=62(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 54
LDI r2, 81
LDI r3, 62
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
