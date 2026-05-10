; DESCRIPTION: Places a yellow 102x43 box at position (130, 9).
; PLAN: r0=130(x), r1=9(y), r2=102(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 9
LDI r2, 102
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
