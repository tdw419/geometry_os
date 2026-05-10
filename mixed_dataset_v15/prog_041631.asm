; DESCRIPTION: Renders a black line between points (27, 230) and (424, 231).
; PLAN: r0=27(x1), r1=230(y1), r2=424(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 230
LDI r2, 424
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
