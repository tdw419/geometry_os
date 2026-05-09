; DESCRIPTION: Renders a white line between points (398, 196) and (300, 204).
; PLAN: r0=398(x1), r1=196(y1), r2=300(x2), r3=204(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 196
LDI r2, 300
LDI r3, 204
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
