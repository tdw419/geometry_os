; DESCRIPTION: Draws a magenta line from (202, 215) to (43, 253).
; PLAN: r0=202(x1), r1=215(y1), r2=43(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 215
LDI r2, 43
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
