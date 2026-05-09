; DESCRIPTION: Composite: . Then Places a cyan 113x60 rectangle at position (91, 44). Then Draws a green line from (106, 212) to (34, 14).
; PLAN: r0=91(x), r1=44(y), r2=113(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=106(x1), r1=212(y1), r2=34(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a cyan 113x60 rectangle at position (91, 44).
; PLAN: r0=91(x), r1=44(y), r2=113(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 44
LDI r2, 113
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a green line from (106, 212) to (34, 14).
; PLAN: r0=106(x1), r1=212(y1), r2=34(x2), r3=14(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 212
LDI r2, 34
LDI r3, 14
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
