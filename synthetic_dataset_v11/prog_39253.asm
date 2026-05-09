; DESCRIPTION: Composite: . Then Draws a red line from (91, 65) to (130, 28). Then Places a green 87x14 rectangle at position (38, 194).
; PLAN: r0=91(x1), r1=65(y1), r2=130(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=38(x), r1=194(y), r2=87(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a red line from (91, 65) to (130, 28).
; PLAN: r0=91(x1), r1=65(y1), r2=130(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 65
LDI r2, 130
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a green 87x14 rectangle at position (38, 194).
; PLAN: r0=38(x), r1=194(y), r2=87(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 194
LDI r2, 87
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
