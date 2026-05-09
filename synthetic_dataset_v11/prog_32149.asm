; DESCRIPTION: Composite: . Then Renders a purple line between points (143, 230) and (252, 255). Then Places a yellow 66x54 rectangle at position (38, 71).
; PLAN: r0=143(x1), r1=230(y1), r2=252(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=38(x), r1=71(y), r2=66(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple line between points (143, 230) and (252, 255).
; PLAN: r0=143(x1), r1=230(y1), r2=252(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 230
LDI r2, 252
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 66x54 rectangle at position (38, 71).
; PLAN: r0=38(x), r1=71(y), r2=66(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 71
LDI r2, 66
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
