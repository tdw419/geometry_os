; DESCRIPTION: Places a orange 95x110 rectangle at position (388, 55).
; PLAN: r0=388(x), r1=55(y), r2=95(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 55
LDI r2, 95
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
