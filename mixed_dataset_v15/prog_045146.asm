; DESCRIPTION: Renders a black line between points (209, 116) and (386, 223).
; PLAN: r0=209(x1), r1=116(y1), r2=386(x2), r3=223(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 116
LDI r2, 386
LDI r3, 223
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
