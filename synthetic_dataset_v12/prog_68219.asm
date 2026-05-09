; DESCRIPTION: Places a yellow 47x120 rectangle at position (421, 23).
; PLAN: r0=421(x), r1=23(y), r2=47(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 23
LDI r2, 47
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
