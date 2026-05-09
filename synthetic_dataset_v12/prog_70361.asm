; DESCRIPTION: Renders a purple line between points (296, 228) and (485, 228).
; PLAN: r0=296(x1), r1=228(y1), r2=485(x2), r3=228(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 228
LDI r2, 485
LDI r3, 228
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
