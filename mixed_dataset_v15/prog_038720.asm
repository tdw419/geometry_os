; DESCRIPTION: Places a green 91x111 box at position (318, 144).
; PLAN: r0=318(x), r1=144(y), r2=91(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 144
LDI r2, 91
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
