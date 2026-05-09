; DESCRIPTION: Places a white 17x22 rectangle at position (33, 147).
; PLAN: r0=33(x), r1=147(y), r2=17(width), r3=22(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 147
LDI r2, 17
LDI r3, 22
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
