; DESCRIPTION: Places a orange 96x37 rectangle at position (148, 137).
; PLAN: r0=148(x), r1=137(y), r2=96(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 137
LDI r2, 96
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
