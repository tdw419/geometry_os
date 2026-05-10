; DESCRIPTION: Composite: Draws a black line from (73, 38) to (411, 221) then Places a green dot at position (80, 70).
; PLAN: r0=73(x1), r1=38(y1), r2=411(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=80(x), r6=70(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 38
LDI r2, 411
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 80
LDI r6, 70
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
