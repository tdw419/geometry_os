; DESCRIPTION: Renders a yellow line between points (480, 29) and (502, 201).
; PLAN: r0=480(x1), r1=29(y1), r2=502(x2), r3=201(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 29
LDI r2, 502
LDI r3, 201
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
