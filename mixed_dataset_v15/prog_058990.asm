; DESCRIPTION: Places a white 29x83 box at position (307, 195).
; PLAN: r0=307(x), r1=195(y), r2=29(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 195
LDI r2, 29
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
