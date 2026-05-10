; DESCRIPTION: Places a yellow 44x18 box at position (333, 68).
; PLAN: r0=333(x), r1=68(y), r2=44(width), r3=18(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 68
LDI r2, 44
LDI r3, 18
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
