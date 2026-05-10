; DESCRIPTION: Places a green 72x70 box at position (355, 130).
; PLAN: r0=355(x), r1=130(y), r2=72(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 130
LDI r2, 72
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
