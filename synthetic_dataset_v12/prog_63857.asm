; DESCRIPTION: Renders a black line between points (21, 188) and (284, 165).
; PLAN: r0=21(x1), r1=188(y1), r2=284(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 188
LDI r2, 284
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
