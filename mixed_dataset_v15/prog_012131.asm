; DESCRIPTION: Places a orange 113x108 box at position (133, 198).
; PLAN: r0=133(x), r1=198(y), r2=113(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 198
LDI r2, 113
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
