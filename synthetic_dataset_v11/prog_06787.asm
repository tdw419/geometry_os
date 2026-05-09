; DESCRIPTION: Renders a black line between points (191, 86) and (202, 231).
; PLAN: r0=191(x1), r1=86(y1), r2=202(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 86
LDI r2, 202
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
