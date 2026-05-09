; DESCRIPTION: Draws a red line from (146, 225) to (410, 254).
; PLAN: r0=146(x1), r1=225(y1), r2=410(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 225
LDI r2, 410
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
