; DESCRIPTION: Places a orange 110x33 rectangle at position (233, 5).
; PLAN: r0=233(x), r1=5(y), r2=110(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 5
LDI r2, 110
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
