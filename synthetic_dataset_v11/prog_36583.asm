; DESCRIPTION: Places a yellow 33x66 rectangle at position (170, 61).
; PLAN: r0=170(x), r1=61(y), r2=33(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 61
LDI r2, 33
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
