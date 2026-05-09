; DESCRIPTION: Places a orange 22x94 rectangle at position (143, 33).
; PLAN: r0=143(x), r1=33(y), r2=22(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 33
LDI r2, 22
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
