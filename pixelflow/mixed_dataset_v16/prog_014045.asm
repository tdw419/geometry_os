; DESCRIPTION: Places a white 104x100 rectangle at position (81, 13).
; PLAN: r0=81(x), r1=13(y), r2=104(width), r3=100(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 13
LDI r2, 104
LDI r3, 100
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
