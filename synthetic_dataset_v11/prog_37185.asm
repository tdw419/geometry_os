; DESCRIPTION: Places a red 104x44 rectangle at position (6, 179).
; PLAN: r0=6(x), r1=179(y), r2=104(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 179
LDI r2, 104
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
