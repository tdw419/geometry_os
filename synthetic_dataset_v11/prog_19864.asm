; DESCRIPTION: Places a orange 38x94 rectangle at position (65, 106).
; PLAN: r0=65(x), r1=106(y), r2=38(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 106
LDI r2, 38
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
