; DESCRIPTION: Places a yellow 11x81 rectangle at position (23, 129).
; PLAN: r0=23(x), r1=129(y), r2=11(width), r3=81(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 129
LDI r2, 11
LDI r3, 81
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
