; DESCRIPTION: Renders a white line between points (298, 87) and (16, 0).
; PLAN: r0=298(x1), r1=87(y1), r2=16(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 87
LDI r2, 16
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
