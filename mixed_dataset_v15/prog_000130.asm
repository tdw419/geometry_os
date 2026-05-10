; DESCRIPTION: Places a green 92x20 box at position (371, 183).
; PLAN: r0=371(x), r1=183(y), r2=92(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 183
LDI r2, 92
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
