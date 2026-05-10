; DESCRIPTION: Places a white 21x25 box at position (324, 34).
; PLAN: r0=324(x), r1=34(y), r2=21(width), r3=25(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 34
LDI r2, 21
LDI r3, 25
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
