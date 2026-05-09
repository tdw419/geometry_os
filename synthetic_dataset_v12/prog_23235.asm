; DESCRIPTION: Renders a black line between points (460, 12) and (173, 241).
; PLAN: r0=460(x1), r1=12(y1), r2=173(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 12
LDI r2, 173
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
