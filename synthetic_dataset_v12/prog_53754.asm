; DESCRIPTION: Places a orange 99x30 rectangle at position (391, 43).
; PLAN: r0=391(x), r1=43(y), r2=99(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 43
LDI r2, 99
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
