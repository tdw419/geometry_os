; DESCRIPTION: Places a orange 23x115 rectangle at position (104, 59).
; PLAN: r0=104(x), r1=59(y), r2=23(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 59
LDI r2, 23
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
