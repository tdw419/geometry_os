; DESCRIPTION: Places a green 88x48 rectangle at position (378, 75).
; PLAN: r0=378(x), r1=75(y), r2=88(width), r3=48(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 75
LDI r2, 88
LDI r3, 48
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
