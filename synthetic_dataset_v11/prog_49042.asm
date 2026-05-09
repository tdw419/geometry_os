; DESCRIPTION: Places a orange 116x33 rectangle at position (59, 222).
; PLAN: r0=59(x), r1=222(y), r2=116(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 222
LDI r2, 116
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
