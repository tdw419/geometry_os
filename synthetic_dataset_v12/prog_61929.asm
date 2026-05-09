; DESCRIPTION: Places a orange 99x60 rectangle at position (59, 36).
; PLAN: r0=59(x), r1=36(y), r2=99(width), r3=60(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 36
LDI r2, 99
LDI r3, 60
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
