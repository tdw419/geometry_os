; DESCRIPTION: Renders a black line between points (239, 212) and (493, 209).
; PLAN: r0=239(x1), r1=212(y1), r2=493(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 212
LDI r2, 493
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
