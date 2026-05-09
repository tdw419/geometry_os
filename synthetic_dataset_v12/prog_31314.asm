; DESCRIPTION: Places a white 119x25 rectangle at position (297, 147).
; PLAN: r0=297(x), r1=147(y), r2=119(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 147
LDI r2, 119
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
