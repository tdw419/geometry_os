; DESCRIPTION: Places a orange 75x106 rectangle at position (410, 81).
; PLAN: r0=410(x), r1=81(y), r2=75(width), r3=106(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 81
LDI r2, 75
LDI r3, 106
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
