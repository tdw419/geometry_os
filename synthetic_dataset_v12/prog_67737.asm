; DESCRIPTION: Places a yellow 117x102 rectangle at position (285, 136).
; PLAN: r0=285(x), r1=136(y), r2=117(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 136
LDI r2, 117
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
