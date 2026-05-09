; DESCRIPTION: Places a green 22x65 rectangle at position (382, 20).
; PLAN: r0=382(x), r1=20(y), r2=22(width), r3=65(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 20
LDI r2, 22
LDI r3, 65
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
