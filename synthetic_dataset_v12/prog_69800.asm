; DESCRIPTION: Places a white 119x104 rectangle at position (154, 17).
; PLAN: r0=154(x), r1=17(y), r2=119(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 17
LDI r2, 119
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
