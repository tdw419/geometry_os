; DESCRIPTION: Renders a black line between points (224, 236) and (267, 216).
; PLAN: r0=224(x1), r1=236(y1), r2=267(x2), r3=216(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 236
LDI r2, 267
LDI r3, 216
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
