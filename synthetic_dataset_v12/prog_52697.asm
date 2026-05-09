; DESCRIPTION: Renders a magenta line between points (202, 25) and (275, 177).
; PLAN: r0=202(x1), r1=25(y1), r2=275(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 25
LDI r2, 275
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
