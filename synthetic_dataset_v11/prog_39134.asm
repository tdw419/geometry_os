; DESCRIPTION: Composite: . Then Sets a single purple pixel at (244, 200). Then Draws a blue line from (146, 195) to (213, 175).
; PLAN: r0=244(x), r1=200(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r0=146(x1), r1=195(y1), r2=213(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single purple pixel at (244, 200).
; PLAN: r0=244(x), r1=200(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 244
LDI r1, 200
LDI r2, 0xAA00FF
PSET r0, r1, r2
; DESCRIPTION: Draws a blue line from (146, 195) to (213, 175).
; PLAN: r0=146(x1), r1=195(y1), r2=213(x2), r3=175(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 195
LDI r2, 213
LDI r3, 175
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
