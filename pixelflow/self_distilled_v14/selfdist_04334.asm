; DESCRIPTION: Places a green 52x84 box at position (242, 2).
; PLAN: r0=242(x), r1=2(y), r2=52(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 2
LDI r2, 52
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
