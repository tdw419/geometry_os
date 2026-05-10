; DESCRIPTION: Places a white 11x102 rectangle at position (147, 57).
; PLAN: r0=147(x), r1=57(y), r2=11(width), r3=102(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 57
LDI r2, 11
LDI r3, 102
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
