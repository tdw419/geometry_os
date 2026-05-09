; DESCRIPTION: Renders a green line between points (275, 167) and (246, 146).
; PLAN: r0=275(x1), r1=167(y1), r2=246(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 167
LDI r2, 246
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
