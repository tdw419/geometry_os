; DESCRIPTION: Draws a red line from (146, 186) to (117, 113).
; PLAN: r0=146(x1), r1=186(y1), r2=117(x2), r3=113(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 186
LDI r2, 117
LDI r3, 113
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
