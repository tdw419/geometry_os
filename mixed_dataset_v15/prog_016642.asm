; DESCRIPTION: Renders a magenta line between points (254, 19) and (242, 253).
; PLAN: r0=254(x1), r1=19(y1), r2=242(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 19
LDI r2, 242
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
