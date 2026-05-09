; DESCRIPTION: Renders a magenta line between points (94, 228) and (460, 217).
; PLAN: r0=94(x1), r1=228(y1), r2=460(x2), r3=217(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 228
LDI r2, 460
LDI r3, 217
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
