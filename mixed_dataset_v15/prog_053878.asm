; DESCRIPTION: Renders a white line between points (295, 211) and (459, 57).
; PLAN: r0=295(x1), r1=211(y1), r2=459(x2), r3=57(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 211
LDI r2, 459
LDI r3, 57
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
