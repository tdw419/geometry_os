; DESCRIPTION: Composite: . Then Renders a yellow line between points (181, 24) and (197, 158). Then Places a orange 78x71 rectangle at position (58, 169).
; PLAN: r0=181(x1), r1=24(y1), r2=197(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=58(x), r1=169(y), r2=78(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a yellow line between points (181, 24) and (197, 158).
; PLAN: r0=181(x1), r1=24(y1), r2=197(x2), r3=158(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 24
LDI r2, 197
LDI r3, 158
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 78x71 rectangle at position (58, 169).
; PLAN: r0=58(x), r1=169(y), r2=78(width), r3=71(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 169
LDI r2, 78
LDI r3, 71
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
