; DESCRIPTION: Draws a green line from (154, 33) to (341, 71).
; PLAN: r0=154(x1), r1=33(y1), r2=341(x2), r3=71(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 33
LDI r2, 341
LDI r3, 71
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
