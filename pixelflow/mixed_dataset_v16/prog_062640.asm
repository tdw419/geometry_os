; DESCRIPTION: Places a orange 33x68 box at position (98, 44).
; PLAN: r0=98(x), r1=44(y), r2=33(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 44
LDI r2, 33
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
