; DESCRIPTION: Composite: . Then Draws a cyan line from (158, 212) to (212, 244). Then Places a blue 79x69 rectangle at position (28, 129).
; PLAN: r0=158(x1), r1=212(y1), r2=212(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=28(x), r1=129(y), r2=79(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (158, 212) to (212, 244).
; PLAN: r0=158(x1), r1=212(y1), r2=212(x2), r3=244(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 212
LDI r2, 212
LDI r3, 244
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue 79x69 rectangle at position (28, 129).
; PLAN: r0=28(x), r1=129(y), r2=79(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 129
LDI r2, 79
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
