; DESCRIPTION: Places a yellow 11x75 rectangle at position (61, 13).
; PLAN: r0=61(x), r1=13(y), r2=11(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 13
LDI r2, 11
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
