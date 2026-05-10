; DESCRIPTION: Places a yellow 28x115 box at position (328, 104).
; PLAN: r0=328(x), r1=104(y), r2=28(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 104
LDI r2, 28
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
