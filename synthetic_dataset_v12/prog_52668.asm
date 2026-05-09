; DESCRIPTION: Places a purple 22x75 rectangle at position (150, 130).
; PLAN: r0=150(x), r1=130(y), r2=22(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 130
LDI r2, 22
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
