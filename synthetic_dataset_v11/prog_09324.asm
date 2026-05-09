; DESCRIPTION: Draws a red line from (171, 151) to (230, 198).
; PLAN: r0=171(x1), r1=151(y1), r2=230(x2), r3=198(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 151
LDI r2, 230
LDI r3, 198
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
