; DESCRIPTION: Places a white 34x117 rectangle at position (104, 132).
; PLAN: r0=104(x), r1=132(y), r2=34(width), r3=117(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 132
LDI r2, 34
LDI r3, 117
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
