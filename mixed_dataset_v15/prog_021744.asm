; DESCRIPTION: Places a black 103x31 rectangle at position (129, 91).
; PLAN: r0=129(x), r1=91(y), r2=103(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 91
LDI r2, 103
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
