; DESCRIPTION: Renders a magenta line between points (39, 63) and (333, 228).
; PLAN: r0=39(x1), r1=63(y1), r2=333(x2), r3=228(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 63
LDI r2, 333
LDI r3, 228
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
