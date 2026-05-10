; DESCRIPTION: Renders a purple line between points (294, 151) and (409, 213).
; PLAN: r0=294(x1), r1=151(y1), r2=409(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 151
LDI r2, 409
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
