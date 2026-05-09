; DESCRIPTION: Draws a magenta line from (193, 154) to (503, 177).
; PLAN: r0=193(x1), r1=154(y1), r2=503(x2), r3=177(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 154
LDI r2, 503
LDI r3, 177
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
