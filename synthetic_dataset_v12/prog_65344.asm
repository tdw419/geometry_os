; DESCRIPTION: Places a white 14x72 rectangle at position (376, 51).
; PLAN: r0=376(x), r1=51(y), r2=14(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 51
LDI r2, 14
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
