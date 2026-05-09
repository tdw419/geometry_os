; DESCRIPTION: Places a orange 111x13 rectangle at position (383, 24).
; PLAN: r0=383(x), r1=24(y), r2=111(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 24
LDI r2, 111
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
