; DESCRIPTION: Places a orange 105x65 rectangle at position (370, 44).
; PLAN: r0=370(x), r1=44(y), r2=105(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 44
LDI r2, 105
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
