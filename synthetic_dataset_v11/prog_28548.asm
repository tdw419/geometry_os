; DESCRIPTION: Composite: . Then Renders a yellow box of size 49x71 starting at (47, 46). Then Renders a red line between points (97, 249) and (184, 17).
; PLAN: r0=47(x), r1=46(y), r2=49(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=97(x1), r1=249(y1), r2=184(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow box of size 49x71 starting at (47, 46).
; PLAN: r0=47(x), r1=46(y), r2=49(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 46
LDI r2, 49
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a red line between points (97, 249) and (184, 17).
; PLAN: r0=97(x1), r1=249(y1), r2=184(x2), r3=17(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 249
LDI r2, 184
LDI r3, 17
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
