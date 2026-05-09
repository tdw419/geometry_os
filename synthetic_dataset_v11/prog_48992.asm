; DESCRIPTION: Composite: . Then Renders a green box of size 97x66 starting at (70, 159). Then Draws a cyan line from (209, 161) to (34, 157).
; PLAN: r0=70(x), r1=159(y), r2=97(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=209(x1), r1=161(y1), r2=34(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a green box of size 97x66 starting at (70, 159).
; PLAN: r0=70(x), r1=159(y), r2=97(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 159
LDI r2, 97
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a cyan line from (209, 161) to (34, 157).
; PLAN: r0=209(x1), r1=161(y1), r2=34(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 161
LDI r2, 34
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
