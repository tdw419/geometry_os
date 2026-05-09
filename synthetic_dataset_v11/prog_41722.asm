; DESCRIPTION: Composite: . Then Draws a white line from (221, 90) to (157, 160). Then Places a orange 115x49 rectangle at position (46, 162).
; PLAN: r0=221(x1), r1=90(y1), r2=157(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=46(x), r1=162(y), r2=115(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (221, 90) to (157, 160).
; PLAN: r0=221(x1), r1=90(y1), r2=157(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 90
LDI r2, 157
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange 115x49 rectangle at position (46, 162).
; PLAN: r0=46(x), r1=162(y), r2=115(width), r3=49(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 162
LDI r2, 115
LDI r3, 49
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
