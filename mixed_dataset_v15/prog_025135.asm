; DESCRIPTION: Places a white 49x58 box at position (128, 46).
; PLAN: r0=128(x), r1=46(y), r2=49(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 46
LDI r2, 49
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
