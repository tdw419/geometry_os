; DESCRIPTION: Draws a magenta line from (120, 27) to (50, 124).
; PLAN: r0=120(x1), r1=27(y1), r2=50(x2), r3=124(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 27
LDI r2, 50
LDI r3, 124
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
