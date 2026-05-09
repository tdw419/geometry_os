; DESCRIPTION: Composite: . Then Places a black 119x31 rectangle at position (98, 137). Then Draws a purple line from (103, 248) to (221, 137).
; PLAN: r0=98(x), r1=137(y), r2=119(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=103(x1), r1=248(y1), r2=221(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a black 119x31 rectangle at position (98, 137).
; PLAN: r0=98(x), r1=137(y), r2=119(width), r3=31(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 137
LDI r2, 119
LDI r3, 31
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (103, 248) to (221, 137).
; PLAN: r0=103(x1), r1=248(y1), r2=221(x2), r3=137(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 248
LDI r2, 221
LDI r3, 137
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
