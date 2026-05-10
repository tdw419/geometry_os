; DESCRIPTION: Places a yellow 89x74 rectangle at position (421, 10).
; PLAN: r0=421(x), r1=10(y), r2=89(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 10
LDI r2, 89
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
