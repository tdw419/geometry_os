; DESCRIPTION: Places a red 104x80 box at position (362, 79).
; PLAN: r0=362(x), r1=79(y), r2=104(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 79
LDI r2, 104
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
