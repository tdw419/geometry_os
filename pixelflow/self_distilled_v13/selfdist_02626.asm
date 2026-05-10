; DESCRIPTION: Places a white 65x68 box at position (332, 101).
; PLAN: r0=332(x), r1=101(y), r2=65(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 101
LDI r2, 65
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
