; DESCRIPTION: Places a orange 39x70 rectangle at position (233, 102).
; PLAN: r0=233(x), r1=102(y), r2=39(width), r3=70(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 102
LDI r2, 39
LDI r3, 70
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
