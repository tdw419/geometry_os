; DESCRIPTION: Places a white 11x104 rectangle at position (9, 107).
; PLAN: r0=9(x), r1=107(y), r2=11(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 107
LDI r2, 11
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
