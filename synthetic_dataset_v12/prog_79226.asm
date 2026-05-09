; DESCRIPTION: Places a white 31x32 rectangle at position (470, 211).
; PLAN: r0=470(x), r1=211(y), r2=31(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 211
LDI r2, 31
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
