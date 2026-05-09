; DESCRIPTION: Places a white 28x120 rectangle at position (40, 104).
; PLAN: r0=40(x), r1=104(y), r2=28(width), r3=120(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 104
LDI r2, 28
LDI r3, 120
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
