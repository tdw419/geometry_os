; DESCRIPTION: Renders a black line between points (413, 86) and (460, 166).
; PLAN: r0=413(x1), r1=86(y1), r2=460(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 86
LDI r2, 460
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
