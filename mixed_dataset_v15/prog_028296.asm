; DESCRIPTION: Places a white 25x80 box at position (332, 32).
; PLAN: r0=332(x), r1=32(y), r2=25(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 32
LDI r2, 25
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
