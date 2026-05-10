; DESCRIPTION: Places a cyan 104x63 rectangle at position (361, 110).
; PLAN: r0=361(x), r1=110(y), r2=104(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 110
LDI r2, 104
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
