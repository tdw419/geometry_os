; DESCRIPTION: Draws a magenta line from (156, 82) to (165, 57).
; PLAN: r0=156(x1), r1=82(y1), r2=165(x2), r3=57(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 82
LDI r2, 165
LDI r3, 57
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
