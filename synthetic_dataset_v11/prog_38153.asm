; DESCRIPTION: Composite: . Then Draws a blue line from (114, 153) to (72, 231). Then Places a yellow 73x93 rectangle at position (46, 162).
; PLAN: r0=114(x1), r1=153(y1), r2=72(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=46(x), r1=162(y), r2=73(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue line from (114, 153) to (72, 231).
; PLAN: r0=114(x1), r1=153(y1), r2=72(x2), r3=231(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 153
LDI r2, 72
LDI r3, 231
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 73x93 rectangle at position (46, 162).
; PLAN: r0=46(x), r1=162(y), r2=73(width), r3=93(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 162
LDI r2, 73
LDI r3, 93
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
