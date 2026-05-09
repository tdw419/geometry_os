; DESCRIPTION: Places a green 109x114 rectangle at position (96, 104).
; PLAN: r0=96(x), r1=104(y), r2=109(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 104
LDI r2, 109
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
