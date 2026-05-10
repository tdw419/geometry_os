; DESCRIPTION: Draws a magenta line from (487, 236) to (439, 8).
; PLAN: r0=487(x1), r1=236(y1), r2=439(x2), r3=8(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 236
LDI r2, 439
LDI r3, 8
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
