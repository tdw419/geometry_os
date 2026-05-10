; DESCRIPTION: Places a orange 80x103 box at position (105, 186).
; PLAN: r0=105(x), r1=186(y), r2=80(width), r3=103(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 186
LDI r2, 80
LDI r3, 103
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
