; DESCRIPTION: Places a white 14x90 rectangle at position (379, 94).
; PLAN: r0=379(x), r1=94(y), r2=14(width), r3=90(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 94
LDI r2, 14
LDI r3, 90
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
