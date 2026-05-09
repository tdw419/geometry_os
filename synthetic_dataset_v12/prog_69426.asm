; DESCRIPTION: Places a white 71x33 rectangle at position (147, 94).
; PLAN: r0=147(x), r1=94(y), r2=71(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 94
LDI r2, 71
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
