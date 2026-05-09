; DESCRIPTION: Draws a green line from (146, 208) to (38, 173).
; PLAN: r0=146(x1), r1=208(y1), r2=38(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 208
LDI r2, 38
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
