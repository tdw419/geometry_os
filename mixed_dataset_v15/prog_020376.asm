; DESCRIPTION: Places a yellow 104x90 rectangle at position (368, 110).
; PLAN: r0=368(x), r1=110(y), r2=104(width), r3=90(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 110
LDI r2, 104
LDI r3, 90
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
