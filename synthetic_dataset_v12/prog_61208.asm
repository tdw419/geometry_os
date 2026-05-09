; DESCRIPTION: Places a orange 59x107 rectangle at position (273, 104).
; PLAN: r0=273(x), r1=104(y), r2=59(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 104
LDI r2, 59
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
