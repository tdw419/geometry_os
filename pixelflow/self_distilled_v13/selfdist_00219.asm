; DESCRIPTION: Places a orange 69x83 box at position (206, 80).
; PLAN: r0=206(x), r1=80(y), r2=69(width), r3=83(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 80
LDI r2, 69
LDI r3, 83
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
