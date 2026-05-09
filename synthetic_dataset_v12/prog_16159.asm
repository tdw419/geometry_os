; DESCRIPTION: Places a green 19x37 rectangle at position (242, 130).
; PLAN: r0=242(x), r1=130(y), r2=19(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 130
LDI r2, 19
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
