; DESCRIPTION: Places a yellow 40x28 box at position (122, 39).
; PLAN: r0=122(x), r1=39(y), r2=40(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 39
LDI r2, 40
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
