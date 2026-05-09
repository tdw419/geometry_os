; DESCRIPTION: Places a green 104x54 rectangle at position (61, 17).
; PLAN: r0=61(x), r1=17(y), r2=104(width), r3=54(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 17
LDI r2, 104
LDI r3, 54
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
