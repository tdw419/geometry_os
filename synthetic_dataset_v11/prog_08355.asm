; DESCRIPTION: Composite: . Then Draws a cyan line from (149, 168) to (187, 90). Then Places a purple 81x106 rectangle at position (105, 4).
; PLAN: r0=149(x1), r1=168(y1), r2=187(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=105(x), r1=4(y), r2=81(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (149, 168) to (187, 90).
; PLAN: r0=149(x1), r1=168(y1), r2=187(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 168
LDI r2, 187
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 81x106 rectangle at position (105, 4).
; PLAN: r0=105(x), r1=4(y), r2=81(width), r3=106(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 4
LDI r2, 81
LDI r3, 106
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
