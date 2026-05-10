; DESCRIPTION: Renders a purple line between points (215, 122) and (276, 228).
; PLAN: r0=215(x1), r1=122(y1), r2=276(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 122
LDI r2, 276
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
