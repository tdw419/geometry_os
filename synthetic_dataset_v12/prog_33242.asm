; DESCRIPTION: Draws a magenta line from (209, 154) to (121, 154).
; PLAN: r0=209(x1), r1=154(y1), r2=121(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 154
LDI r2, 121
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
