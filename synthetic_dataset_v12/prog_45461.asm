; DESCRIPTION: Places a white 105x58 rectangle at position (237, 161).
; PLAN: r0=237(x), r1=161(y), r2=105(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 161
LDI r2, 105
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
