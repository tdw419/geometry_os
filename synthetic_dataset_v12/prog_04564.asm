; DESCRIPTION: Places a yellow 80x50 rectangle at position (104, 75).
; PLAN: r0=104(x), r1=75(y), r2=80(width), r3=50(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 75
LDI r2, 80
LDI r3, 50
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
