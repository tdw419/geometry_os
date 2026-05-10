; DESCRIPTION: Places a yellow 26x111 box at position (222, 193).
; PLAN: r0=222(x), r1=193(y), r2=26(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 193
LDI r2, 26
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
