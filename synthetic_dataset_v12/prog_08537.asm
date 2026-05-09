; DESCRIPTION: Places a white 11x14 rectangle at position (454, 195).
; PLAN: r0=454(x), r1=195(y), r2=11(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 195
LDI r2, 11
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
