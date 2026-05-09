; DESCRIPTION: Composite: . Then Places a orange 43x38 rectangle at position (97, 192). Then Renders a purple line between points (132, 46) and (76, 216).
; PLAN: r0=97(x), r1=192(y), r2=43(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=132(x1), r1=46(y1), r2=76(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a orange 43x38 rectangle at position (97, 192).
; PLAN: r0=97(x), r1=192(y), r2=43(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 192
LDI r2, 43
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a purple line between points (132, 46) and (76, 216).
; PLAN: r0=132(x1), r1=46(y1), r2=76(x2), r3=216(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 46
LDI r2, 76
LDI r3, 216
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
