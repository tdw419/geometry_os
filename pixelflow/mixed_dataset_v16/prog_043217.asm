; DESCRIPTION: Renders a black line between points (64, 39) and (196, 174).
; PLAN: r0=64(x1), r1=39(y1), r2=196(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 39
LDI r2, 196
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
