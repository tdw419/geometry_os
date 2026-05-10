; DESCRIPTION: Renders a magenta line between points (410, 22) and (146, 171).
; PLAN: r0=410(x1), r1=22(y1), r2=146(x2), r3=171(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 22
LDI r2, 146
LDI r3, 171
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
