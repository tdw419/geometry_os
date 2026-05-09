; DESCRIPTION: Places a yellow 77x119 rectangle at position (27, 54).
; PLAN: r0=27(x), r1=54(y), r2=77(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 54
LDI r2, 77
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
