; DESCRIPTION: Places a green 98x11 rectangle at position (104, 119).
; PLAN: r0=104(x), r1=119(y), r2=98(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 119
LDI r2, 98
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
