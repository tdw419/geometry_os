; DESCRIPTION: Places a red 117x26 rectangle at position (359, 112).
; PLAN: r0=359(x), r1=112(y), r2=117(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 112
LDI r2, 117
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
