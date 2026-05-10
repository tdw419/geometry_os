; DESCRIPTION: Places a green 104x115 box at position (338, 7).
; PLAN: r0=338(x), r1=7(y), r2=104(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 7
LDI r2, 104
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
