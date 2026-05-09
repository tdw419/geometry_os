; DESCRIPTION: Renders a magenta line between points (445, 178) and (286, 42).
; PLAN: r0=445(x1), r1=178(y1), r2=286(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 178
LDI r2, 286
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
