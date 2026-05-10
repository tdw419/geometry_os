; DESCRIPTION: Draws a green line from (403, 134) to (148, 173).
; PLAN: r0=403(x1), r1=134(y1), r2=148(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 134
LDI r2, 148
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
