; DESCRIPTION: Places a green 75x109 rectangle at position (370, 13).
; PLAN: r0=370(x), r1=13(y), r2=75(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 13
LDI r2, 75
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
