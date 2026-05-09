; DESCRIPTION: Places a orange 111x65 rectangle at position (149, 4).
; PLAN: r0=149(x), r1=4(y), r2=111(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 4
LDI r2, 111
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
