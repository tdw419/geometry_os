; DESCRIPTION: Places a black 10x107 rectangle at position (77, 40).
; PLAN: r0=77(x), r1=40(y), r2=10(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 40
LDI r2, 10
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
