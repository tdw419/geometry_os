; DESCRIPTION: Draws a black line from (435, 244) to (164, 38).
; PLAN: r0=435(x1), r1=244(y1), r2=164(x2), r3=38(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 244
LDI r2, 164
LDI r3, 38
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
