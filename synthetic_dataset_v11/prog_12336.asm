; DESCRIPTION: Draws a red line from (207, 146) to (250, 215).
; PLAN: r0=207(x1), r1=146(y1), r2=250(x2), r3=215(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 146
LDI r2, 250
LDI r3, 215
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
