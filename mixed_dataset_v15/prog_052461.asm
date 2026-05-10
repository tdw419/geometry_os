; DESCRIPTION: Renders a white line between points (305, 56) and (251, 242).
; PLAN: r0=305(x1), r1=56(y1), r2=251(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 56
LDI r2, 251
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
