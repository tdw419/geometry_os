; DESCRIPTION: Places a red 80x119 rectangle at position (334, 11).
; PLAN: r0=334(x), r1=11(y), r2=80(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 11
LDI r2, 80
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
