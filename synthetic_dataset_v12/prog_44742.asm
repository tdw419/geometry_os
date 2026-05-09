; DESCRIPTION: Places a white 19x49 rectangle at position (364, 152).
; PLAN: r0=364(x), r1=152(y), r2=19(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 152
LDI r2, 19
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
