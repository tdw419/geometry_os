; DESCRIPTION: Places a green 14x78 rectangle at position (399, 142).
; PLAN: r0=399(x), r1=142(y), r2=14(width), r3=78(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 142
LDI r2, 14
LDI r3, 78
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
