; DESCRIPTION: Renders a black line between points (267, 244) and (386, 13).
; PLAN: r0=267(x1), r1=244(y1), r2=386(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 244
LDI r2, 386
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
