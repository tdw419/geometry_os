; DESCRIPTION: Places a black 117x74 rectangle at position (269, 91).
; PLAN: r0=269(x), r1=91(y), r2=117(width), r3=74(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 91
LDI r2, 117
LDI r3, 74
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
