; DESCRIPTION: Places a cyan 104x19 rectangle at position (78, 178).
; PLAN: r0=78(x), r1=178(y), r2=104(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 178
LDI r2, 104
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
