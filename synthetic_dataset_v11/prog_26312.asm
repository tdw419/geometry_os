; DESCRIPTION: Composite: . Then Draws a orange line from (118, 207) to (75, 114). Then Renders a cyan box of size 22x25 starting at (56, 76).
; PLAN: r0=118(x1), r1=207(y1), r2=75(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=56(x), r1=76(y), r2=22(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a orange line from (118, 207) to (75, 114).
; PLAN: r0=118(x1), r1=207(y1), r2=75(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 207
LDI r2, 75
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan box of size 22x25 starting at (56, 76).
; PLAN: r0=56(x), r1=76(y), r2=22(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 76
LDI r2, 22
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
