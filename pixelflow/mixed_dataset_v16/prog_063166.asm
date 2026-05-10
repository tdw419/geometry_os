; DESCRIPTION: Places a yellow 101x85 box at position (284, 35).
; PLAN: r0=284(x), r1=35(y), r2=101(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 35
LDI r2, 101
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
