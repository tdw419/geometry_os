; DESCRIPTION: Places a orange 90x33 rectangle at position (325, 199).
; PLAN: r0=325(x), r1=199(y), r2=90(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 199
LDI r2, 90
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
