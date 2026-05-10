; DESCRIPTION: Places a white 21x13 box at position (190, 17).
; PLAN: r0=190(x), r1=17(y), r2=21(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 17
LDI r2, 21
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
