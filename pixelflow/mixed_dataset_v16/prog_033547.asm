; DESCRIPTION: Places a orange 117x71 box at position (353, 16).
; PLAN: r0=353(x), r1=16(y), r2=117(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 16
LDI r2, 117
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
