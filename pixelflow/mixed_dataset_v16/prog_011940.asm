; DESCRIPTION: Places a green 30x48 box at position (358, 49).
; PLAN: r0=358(x), r1=49(y), r2=30(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 49
LDI r2, 30
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
