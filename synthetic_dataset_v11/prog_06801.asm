; DESCRIPTION: Renders a black line between points (191, 22) and (154, 215).
; PLAN: r0=191(x1), r1=22(y1), r2=154(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 22
LDI r2, 154
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
