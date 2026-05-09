; DESCRIPTION: Renders a white line between points (111, 204) and (154, 79).
; PLAN: r0=111(x1), r1=204(y1), r2=154(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 204
LDI r2, 154
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
