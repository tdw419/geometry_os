; DESCRIPTION: Places a yellow 34x25 box at position (299, 3).
; PLAN: r0=299(x), r1=3(y), r2=34(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 3
LDI r2, 34
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
