; DESCRIPTION: Renders a magenta line between points (31, 153) and (502, 236).
; PLAN: r0=31(x1), r1=153(y1), r2=502(x2), r3=236(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 153
LDI r2, 502
LDI r3, 236
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
