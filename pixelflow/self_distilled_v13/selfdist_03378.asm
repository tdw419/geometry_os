; DESCRIPTION: Places a white 83x96 box at position (226, 157).
; PLAN: r0=226(x), r1=157(y), r2=83(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 157
LDI r2, 83
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
