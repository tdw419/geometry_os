; DESCRIPTION: Draws a black line from (330, 129) to (253, 38).
; PLAN: r0=330(x1), r1=129(y1), r2=253(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 129
LDI r2, 253
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
