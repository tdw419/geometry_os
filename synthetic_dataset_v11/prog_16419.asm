; DESCRIPTION: Renders a magenta line between points (42, 194) and (160, 125).
; PLAN: r0=42(x1), r1=194(y1), r2=160(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 194
LDI r2, 160
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
