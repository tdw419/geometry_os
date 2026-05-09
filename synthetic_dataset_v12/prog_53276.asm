; DESCRIPTION: Places a white 59x15 rectangle at position (52, 147).
; PLAN: r0=52(x), r1=147(y), r2=59(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 147
LDI r2, 59
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
