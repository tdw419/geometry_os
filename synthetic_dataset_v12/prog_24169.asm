; DESCRIPTION: Renders a green line between points (441, 221) and (370, 107).
; PLAN: r0=441(x1), r1=221(y1), r2=370(x2), r3=107(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 221
LDI r2, 370
LDI r3, 107
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
