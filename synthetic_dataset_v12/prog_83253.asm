; DESCRIPTION: Draws a white line from (146, 186) to (206, 178).
; PLAN: r0=146(x1), r1=186(y1), r2=206(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 186
LDI r2, 206
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
