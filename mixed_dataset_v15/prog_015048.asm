; DESCRIPTION: Renders a magenta line between points (94, 111) and (326, 103).
; PLAN: r0=94(x1), r1=111(y1), r2=326(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 111
LDI r2, 326
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
