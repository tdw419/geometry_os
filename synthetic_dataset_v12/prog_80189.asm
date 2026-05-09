; DESCRIPTION: Renders a magenta line between points (277, 149) and (391, 228).
; PLAN: r0=277(x1), r1=149(y1), r2=391(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 149
LDI r2, 391
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
