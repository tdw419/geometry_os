; DESCRIPTION: Places a orange 48x95 box at position (141, 4).
; PLAN: r0=141(x), r1=4(y), r2=48(width), r3=95(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 4
LDI r2, 48
LDI r3, 95
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
