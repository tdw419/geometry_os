; DESCRIPTION: Places a yellow 56x74 rectangle at position (334, 175).
; PLAN: r0=334(x), r1=175(y), r2=56(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 175
LDI r2, 56
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
