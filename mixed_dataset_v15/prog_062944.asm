; DESCRIPTION: Places a cyan 24x118 box at position (400, 144).
; PLAN: r0=400(x), r1=144(y), r2=24(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 144
LDI r2, 24
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
