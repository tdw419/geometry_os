; DESCRIPTION: Composite: . Then Draws a black line from (101, 31) to (58, 220). Then Places a red 13x65 rectangle at position (113, 150).
; PLAN: r0=101(x1), r1=31(y1), r2=58(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=113(x), r1=150(y), r2=13(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (101, 31) to (58, 220).
; PLAN: r0=101(x1), r1=31(y1), r2=58(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 31
LDI r2, 58
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a red 13x65 rectangle at position (113, 150).
; PLAN: r0=113(x), r1=150(y), r2=13(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 150
LDI r2, 13
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
