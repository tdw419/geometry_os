; DESCRIPTION: Places a white 112x104 rectangle at position (366, 28).
; PLAN: r0=366(x), r1=28(y), r2=112(width), r3=104(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 28
LDI r2, 112
LDI r3, 104
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
