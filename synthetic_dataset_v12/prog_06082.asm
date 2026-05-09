; DESCRIPTION: Places a green 80x40 rectangle at position (177, 22).
; PLAN: r0=177(x), r1=22(y), r2=80(width), r3=40(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 22
LDI r2, 80
LDI r3, 40
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
