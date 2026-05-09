; DESCRIPTION: Places a orange 43x35 rectangle at position (301, 139).
; PLAN: r0=301(x), r1=139(y), r2=43(width), r3=35(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 139
LDI r2, 43
LDI r3, 35
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
