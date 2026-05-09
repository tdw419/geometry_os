; DESCRIPTION: Places a orange 119x106 rectangle at position (113, 96).
; PLAN: r0=113(x), r1=96(y), r2=119(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 96
LDI r2, 119
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
