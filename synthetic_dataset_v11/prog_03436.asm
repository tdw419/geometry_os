; DESCRIPTION: Composite: . Then Draws a cyan line from (46, 26) to (208, 43). Then Draws a purple rectangle at (195, 55) with width 51 and height 117.
; PLAN: r0=46(x1), r1=26(y1), r2=208(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=195(x), r1=55(y), r2=51(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a cyan line from (46, 26) to (208, 43).
; PLAN: r0=46(x1), r1=26(y1), r2=208(x2), r3=43(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 26
LDI r2, 208
LDI r3, 43
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (195, 55) with width 51 and height 117.
; PLAN: r0=195(x), r1=55(y), r2=51(width), r3=117(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 55
LDI r2, 51
LDI r3, 117
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
