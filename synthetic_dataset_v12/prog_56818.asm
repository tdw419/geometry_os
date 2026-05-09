; DESCRIPTION: Places a white 32x51 rectangle at position (237, 83).
; PLAN: r0=237(x), r1=83(y), r2=32(width), r3=51(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 83
LDI r2, 32
LDI r3, 51
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
