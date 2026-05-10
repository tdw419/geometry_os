; DESCRIPTION: Renders a magenta line between points (494, 24) and (228, 220).
; PLAN: r0=494(x1), r1=24(y1), r2=228(x2), r3=220(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 24
LDI r2, 228
LDI r3, 220
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
