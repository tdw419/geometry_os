; DESCRIPTION: Places a white 80x40 box at position (260, 4).
; PLAN: r0=260(x), r1=4(y), r2=80(width), r3=40(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 4
LDI r2, 80
LDI r3, 40
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
