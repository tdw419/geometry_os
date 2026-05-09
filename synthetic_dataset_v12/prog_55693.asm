; DESCRIPTION: Places a white 37x83 rectangle at position (266, 92).
; PLAN: r0=266(x), r1=92(y), r2=37(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 92
LDI r2, 37
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
