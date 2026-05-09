; DESCRIPTION: Places a orange 18x57 rectangle at position (127, 54).
; PLAN: r0=127(x), r1=54(y), r2=18(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 54
LDI r2, 18
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
