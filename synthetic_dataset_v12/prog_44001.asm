; DESCRIPTION: Renders a magenta line between points (284, 226) and (151, 43).
; PLAN: r0=284(x1), r1=226(y1), r2=151(x2), r3=43(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 226
LDI r2, 151
LDI r3, 43
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
