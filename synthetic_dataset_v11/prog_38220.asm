; DESCRIPTION: Composite: . Then Renders a red line between points (141, 149) and (10, 165). Then Places a black 39x26 rectangle at position (215, 147).
; PLAN: r0=141(x1), r1=149(y1), r2=10(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=215(x), r1=147(y), r2=39(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a red line between points (141, 149) and (10, 165).
; PLAN: r0=141(x1), r1=149(y1), r2=10(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 149
LDI r2, 10
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black 39x26 rectangle at position (215, 147).
; PLAN: r0=215(x), r1=147(y), r2=39(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 147
LDI r2, 39
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
