; DESCRIPTION: Draws a black line from (460, 130) to (386, 17).
; PLAN: r0=460(x1), r1=130(y1), r2=386(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 130
LDI r2, 386
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
