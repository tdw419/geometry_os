; DESCRIPTION: Draws a purple line from (386, 188) to (435, 213).
; PLAN: r0=386(x1), r1=188(y1), r2=435(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 188
LDI r2, 435
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
