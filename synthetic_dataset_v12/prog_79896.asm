; DESCRIPTION: Places a yellow 54x61 rectangle at position (421, 20).
; PLAN: r0=421(x), r1=20(y), r2=54(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 20
LDI r2, 54
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
