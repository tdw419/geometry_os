; DESCRIPTION: Places a yellow 30x68 box at position (68, 165).
; PLAN: r0=68(x), r1=165(y), r2=30(width), r3=68(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 165
LDI r2, 30
LDI r3, 68
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
