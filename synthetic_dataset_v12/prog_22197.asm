; DESCRIPTION: Places a white 92x94 rectangle at position (325, 115).
; PLAN: r0=325(x), r1=115(y), r2=92(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 115
LDI r2, 92
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
