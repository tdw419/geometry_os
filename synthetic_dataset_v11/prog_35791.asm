; DESCRIPTION: Places a red 46x97 rectangle at position (148, 122).
; PLAN: r0=148(x), r1=122(y), r2=46(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 122
LDI r2, 46
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
