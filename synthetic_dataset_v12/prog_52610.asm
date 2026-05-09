; DESCRIPTION: Renders a green line between points (382, 204) and (279, 143).
; PLAN: r0=382(x1), r1=204(y1), r2=279(x2), r3=143(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 204
LDI r2, 279
LDI r3, 143
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
