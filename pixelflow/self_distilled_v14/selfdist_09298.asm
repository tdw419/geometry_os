; DESCRIPTION: Places a white 43x84 box at position (202, 158).
; PLAN: r0=202(x), r1=158(y), r2=43(width), r3=84(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 158
LDI r2, 43
LDI r3, 84
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
