; DESCRIPTION: Draws a black line from (434, 178) to (146, 121).
; PLAN: r0=434(x1), r1=178(y1), r2=146(x2), r3=121(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 178
LDI r2, 146
LDI r3, 121
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
