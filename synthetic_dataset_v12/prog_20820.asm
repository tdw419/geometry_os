; DESCRIPTION: Places a green 12x83 rectangle at position (220, 25).
; PLAN: r0=220(x), r1=25(y), r2=12(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 25
LDI r2, 12
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
