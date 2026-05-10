; DESCRIPTION: Places a yellow 102x118 rectangle at position (313, 128).
; PLAN: r0=313(x), r1=128(y), r2=102(width), r3=118(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 128
LDI r2, 102
LDI r3, 118
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
