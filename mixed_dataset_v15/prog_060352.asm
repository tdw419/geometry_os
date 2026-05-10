; DESCRIPTION: Draws a black line from (398, 221) to (209, 183).
; PLAN: r0=398(x1), r1=221(y1), r2=209(x2), r3=183(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 221
LDI r2, 209
LDI r3, 183
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
