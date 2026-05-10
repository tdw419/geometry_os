; DESCRIPTION: Places a cyan 45x29 rectangle at position (422, 112).
; PLAN: r0=422(x), r1=112(y), r2=45(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 112
LDI r2, 45
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
