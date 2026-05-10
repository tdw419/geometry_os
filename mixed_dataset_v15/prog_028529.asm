; DESCRIPTION: Places a white 79x36 box at position (309, 40).
; PLAN: r0=309(x), r1=40(y), r2=79(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 40
LDI r2, 79
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
