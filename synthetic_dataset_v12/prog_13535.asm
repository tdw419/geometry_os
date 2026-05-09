; DESCRIPTION: Places a orange 96x106 rectangle at position (341, 44).
; PLAN: r0=341(x), r1=44(y), r2=96(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 44
LDI r2, 96
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
