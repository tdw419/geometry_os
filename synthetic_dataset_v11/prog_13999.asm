; DESCRIPTION: Draws a blue line from (210, 167) to (230, 213).
; PLAN: r0=210(x1), r1=167(y1), r2=230(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 167
LDI r2, 230
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
