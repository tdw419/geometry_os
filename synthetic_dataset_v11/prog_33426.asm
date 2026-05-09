; DESCRIPTION: Draws a black line from (38, 115) to (65, 146).
; PLAN: r0=38(x1), r1=115(y1), r2=65(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 115
LDI r2, 65
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
