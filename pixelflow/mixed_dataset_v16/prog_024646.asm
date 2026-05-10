; DESCRIPTION: Places a orange 25x24 box at position (86, 124).
; PLAN: r0=86(x), r1=124(y), r2=25(width), r3=24(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 124
LDI r2, 25
LDI r3, 24
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
