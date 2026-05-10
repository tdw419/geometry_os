; DESCRIPTION: Places a cyan 81x104 rectangle at position (205, 117).
; PLAN: r0=205(x), r1=117(y), r2=81(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 117
LDI r2, 81
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
