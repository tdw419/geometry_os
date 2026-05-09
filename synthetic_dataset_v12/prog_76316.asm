; DESCRIPTION: Places a cyan 104x117 rectangle at position (48, 137).
; PLAN: r0=48(x), r1=137(y), r2=104(width), r3=117(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 137
LDI r2, 104
LDI r3, 117
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
