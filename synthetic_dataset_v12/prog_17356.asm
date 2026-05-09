; DESCRIPTION: Renders a red line between points (148, 209) and (286, 204).
; PLAN: r0=148(x1), r1=209(y1), r2=286(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 209
LDI r2, 286
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
