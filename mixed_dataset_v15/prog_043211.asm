; DESCRIPTION: Places a white 48x11 rectangle at position (147, 109).
; PLAN: r0=147(x), r1=109(y), r2=48(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 109
LDI r2, 48
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
