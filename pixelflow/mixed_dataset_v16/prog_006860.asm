; DESCRIPTION: Places a yellow 72x72 box at position (287, 165).
; PLAN: r0=287(x), r1=165(y), r2=72(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 165
LDI r2, 72
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
