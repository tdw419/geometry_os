; DESCRIPTION: Places a blue 80x52 box at position (116, 200).
; PLAN: r0=116(x), r1=200(y), r2=80(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 200
LDI r2, 80
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
