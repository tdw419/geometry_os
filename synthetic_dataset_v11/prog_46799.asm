; DESCRIPTION: Places a orange 97x46 rectangle at position (73, 44).
; PLAN: r0=73(x), r1=44(y), r2=97(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 44
LDI r2, 97
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
