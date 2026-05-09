; DESCRIPTION: Places a white 105x33 rectangle at position (142, 147).
; PLAN: r0=142(x), r1=147(y), r2=105(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 147
LDI r2, 105
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
