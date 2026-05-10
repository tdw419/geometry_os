; DESCRIPTION: Places a white 33x78 rectangle at position (195, 17).
; PLAN: r0=195(x), r1=17(y), r2=33(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 17
LDI r2, 33
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
