; DESCRIPTION: Places a orange 36x40 box at position (304, 58).
; PLAN: r0=304(x), r1=58(y), r2=36(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 58
LDI r2, 36
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
