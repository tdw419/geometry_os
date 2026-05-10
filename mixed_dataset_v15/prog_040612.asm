; DESCRIPTION: Places a white 23x19 box at position (103, 8).
; PLAN: r0=103(x), r1=8(y), r2=23(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 8
LDI r2, 23
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
