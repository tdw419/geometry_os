; DESCRIPTION: Draws a green line from (11, 215) to (414, 154).
; PLAN: r0=11(x1), r1=215(y1), r2=414(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 215
LDI r2, 414
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
