; DESCRIPTION: Places a orange 90x55 rectangle at position (339, 65).
; PLAN: r0=339(x), r1=65(y), r2=90(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 65
LDI r2, 90
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
