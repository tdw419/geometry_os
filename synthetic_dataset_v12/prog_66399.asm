; DESCRIPTION: Places a black 33x66 rectangle at position (290, 33).
; PLAN: r0=290(x), r1=33(y), r2=33(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 33
LDI r2, 33
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
