; DESCRIPTION: Draws a red line from (486, 197) to (298, 180).
; PLAN: r0=486(x1), r1=197(y1), r2=298(x2), r3=180(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 197
LDI r2, 298
LDI r3, 180
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
