; DESCRIPTION: Places a orange 26x36 rectangle at position (340, 188).
; PLAN: r0=340(x), r1=188(y), r2=26(width), r3=36(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 188
LDI r2, 26
LDI r3, 36
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
