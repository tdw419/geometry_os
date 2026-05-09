; DESCRIPTION: Places a black 40x96 rectangle at position (77, 98).
; PLAN: r0=77(x), r1=98(y), r2=40(width), r3=96(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 98
LDI r2, 40
LDI r3, 96
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
