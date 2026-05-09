; DESCRIPTION: Composite: . Then Draws a cyan line from (29, 174) to (230, 86). Then Draws a blue circle centered at (117, 36) with radius 24.
; PLAN: r0=29(x1), r1=174(y1), r2=230(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=117(x), r1=36(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a cyan line from (29, 174) to (230, 86).
; PLAN: r0=29(x1), r1=174(y1), r2=230(x2), r3=86(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 174
LDI r2, 230
LDI r3, 86
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a blue circle centered at (117, 36) with radius 24.
; PLAN: r0=117(x), r1=36(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 36
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
