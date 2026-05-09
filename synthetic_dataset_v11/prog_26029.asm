; DESCRIPTION: Renders a green line between points (228, 204) and (40, 8).
; PLAN: r0=228(x1), r1=204(y1), r2=40(x2), r3=8(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 204
LDI r2, 40
LDI r3, 8
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
