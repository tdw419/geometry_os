; DESCRIPTION: Places a orange 54x25 rectangle at position (342, 205).
; PLAN: r0=342(x), r1=205(y), r2=54(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 205
LDI r2, 54
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
