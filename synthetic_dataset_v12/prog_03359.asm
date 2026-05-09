; DESCRIPTION: Renders a magenta line between points (386, 166) and (61, 146).
; PLAN: r0=386(x1), r1=166(y1), r2=61(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 166
LDI r2, 61
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
