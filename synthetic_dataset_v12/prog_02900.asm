; DESCRIPTION: Places a green 13x66 rectangle at position (264, 170).
; PLAN: r0=264(x), r1=170(y), r2=13(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 170
LDI r2, 13
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
