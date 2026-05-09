; DESCRIPTION: Composite: . Then Draws a purple rectangle at (39, 39) with width 64 and height 81. Then Draws a purple line from (177, 77) to (110, 195).
; PLAN: r0=39(x), r1=39(y), r2=64(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=177(x1), r1=77(y1), r2=110(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (39, 39) with width 64 and height 81.
; PLAN: r0=39(x), r1=39(y), r2=64(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 39
LDI r2, 64
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple line from (177, 77) to (110, 195).
; PLAN: r0=177(x1), r1=77(y1), r2=110(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 77
LDI r2, 110
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
