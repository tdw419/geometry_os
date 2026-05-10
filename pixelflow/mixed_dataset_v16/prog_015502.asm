; DESCRIPTION: Places a white 80x17 box at position (20, 19).
; PLAN: r0=20(x), r1=19(y), r2=80(width), r3=17(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 19
LDI r2, 80
LDI r3, 17
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
