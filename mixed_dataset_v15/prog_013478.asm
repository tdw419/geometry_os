; DESCRIPTION: Places a yellow 58x103 rectangle at position (138, 56).
; PLAN: r0=138(x), r1=56(y), r2=58(width), r3=103(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 56
LDI r2, 58
LDI r3, 103
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
