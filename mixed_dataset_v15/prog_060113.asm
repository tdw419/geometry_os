; DESCRIPTION: Draws a red line from (17, 244) to (479, 144).
; PLAN: r0=17(x1), r1=244(y1), r2=479(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 244
LDI r2, 479
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
