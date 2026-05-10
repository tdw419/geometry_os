; DESCRIPTION: Places a cyan 104x65 rectangle at position (241, 61).
; PLAN: r0=241(x), r1=61(y), r2=104(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 61
LDI r2, 104
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
