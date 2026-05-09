; DESCRIPTION: Places a white 80x104 rectangle at position (237, 64).
; PLAN: r0=237(x), r1=64(y), r2=80(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 64
LDI r2, 80
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
