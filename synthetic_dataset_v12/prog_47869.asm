; DESCRIPTION: Places a orange 48x84 rectangle at position (438, 112).
; PLAN: r0=438(x), r1=112(y), r2=48(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 112
LDI r2, 48
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
