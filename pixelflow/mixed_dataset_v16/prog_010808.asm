; DESCRIPTION: Draws a red line from (294, 204) to (164, 0).
; PLAN: r0=294(x1), r1=204(y1), r2=164(x2), r3=0(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 204
LDI r2, 164
LDI r3, 0
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
