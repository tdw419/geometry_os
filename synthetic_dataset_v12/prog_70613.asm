; DESCRIPTION: Places a yellow 104x34 rectangle at position (195, 66).
; PLAN: r0=195(x), r1=66(y), r2=104(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 66
LDI r2, 104
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
