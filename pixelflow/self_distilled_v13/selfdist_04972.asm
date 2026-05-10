; DESCRIPTION: Places a orange 113x99 box at position (289, 17).
; PLAN: r0=289(x), r1=17(y), r2=113(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 17
LDI r2, 113
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
