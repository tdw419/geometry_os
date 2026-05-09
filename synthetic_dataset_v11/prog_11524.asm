; DESCRIPTION: Places a green 120x104 rectangle at position (62, 86).
; PLAN: r0=62(x), r1=86(y), r2=120(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 86
LDI r2, 120
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
