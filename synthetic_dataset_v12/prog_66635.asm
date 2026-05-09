; DESCRIPTION: Places a white 29x57 rectangle at position (77, 13).
; PLAN: r0=77(x), r1=13(y), r2=29(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 13
LDI r2, 29
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
