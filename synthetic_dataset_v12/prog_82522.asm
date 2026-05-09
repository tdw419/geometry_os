; DESCRIPTION: Renders a green line between points (90, 52) and (460, 113).
; PLAN: r0=90(x1), r1=52(y1), r2=460(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 52
LDI r2, 460
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
