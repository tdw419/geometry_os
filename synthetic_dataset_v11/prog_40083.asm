; DESCRIPTION: Composite: . Then Draws a blue line from (238, 253) to (200, 236). Then Places a purple 29x93 rectangle at position (89, 139).
; PLAN: r0=238(x1), r1=253(y1), r2=200(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=89(x), r1=139(y), r2=29(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue line from (238, 253) to (200, 236).
; PLAN: r0=238(x1), r1=253(y1), r2=200(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 253
LDI r2, 200
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple 29x93 rectangle at position (89, 139).
; PLAN: r0=89(x), r1=139(y), r2=29(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 139
LDI r2, 29
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
