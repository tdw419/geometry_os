; DESCRIPTION: Places a orange 103x92 box at position (141, 26).
; PLAN: r0=141(x), r1=26(y), r2=103(width), r3=92(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 26
LDI r2, 103
LDI r3, 92
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
