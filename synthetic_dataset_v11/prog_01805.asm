; DESCRIPTION: Composite: . Then Renders a cyan box of size 12x23 starting at (149, 149). Then Draws a orange line from (216, 240) to (124, 3).
; PLAN: r0=149(x), r1=149(y), r2=12(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=216(x1), r1=240(y1), r2=124(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a cyan box of size 12x23 starting at (149, 149).
; PLAN: r0=149(x), r1=149(y), r2=12(width), r3=23(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 149
LDI r2, 12
LDI r3, 23
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange line from (216, 240) to (124, 3).
; PLAN: r0=216(x1), r1=240(y1), r2=124(x2), r3=3(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 240
LDI r2, 124
LDI r3, 3
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
