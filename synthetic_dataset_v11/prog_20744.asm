; DESCRIPTION: Renders a green line between points (215, 111) and (13, 154).
; PLAN: r0=215(x1), r1=111(y1), r2=13(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 111
LDI r2, 13
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
