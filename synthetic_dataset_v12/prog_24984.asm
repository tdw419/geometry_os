; DESCRIPTION: Renders a black line between points (352, 209) and (175, 240).
; PLAN: r0=352(x1), r1=209(y1), r2=175(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 209
LDI r2, 175
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
