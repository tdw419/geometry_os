; DESCRIPTION: Places a cyan 104x94 rectangle at position (32, 104).
; PLAN: r0=32(x), r1=104(y), r2=104(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 104
LDI r2, 104
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
