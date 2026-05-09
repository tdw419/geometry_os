; DESCRIPTION: Places a yellow 114x102 rectangle at position (131, 128).
; PLAN: r0=131(x), r1=128(y), r2=114(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 128
LDI r2, 114
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
