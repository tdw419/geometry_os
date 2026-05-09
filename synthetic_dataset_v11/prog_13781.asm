; DESCRIPTION: Places a orange 111x59 rectangle at position (87, 162).
; PLAN: r0=87(x), r1=162(y), r2=111(width), r3=59(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 162
LDI r2, 111
LDI r3, 59
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
