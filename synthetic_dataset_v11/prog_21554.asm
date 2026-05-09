; DESCRIPTION: Composite: . Then Draws a cyan rectangle at (138, 127) with width 49 and height 65. Then Draws a purple line from (39, 56) to (226, 201).
; PLAN: r0=138(x), r1=127(y), r2=49(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=39(x1), r1=56(y1), r2=226(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan rectangle at (138, 127) with width 49 and height 65.
; PLAN: r0=138(x), r1=127(y), r2=49(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 127
LDI r2, 49
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (39, 56) to (226, 201).
; PLAN: r0=39(x1), r1=56(y1), r2=226(x2), r3=201(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 56
LDI r2, 226
LDI r3, 201
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
