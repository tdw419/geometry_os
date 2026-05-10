; DESCRIPTION: Places a white 17x30 box at position (306, 124).
; PLAN: r0=306(x), r1=124(y), r2=17(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 124
LDI r2, 17
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
