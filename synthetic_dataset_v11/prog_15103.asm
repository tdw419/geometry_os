; DESCRIPTION: Renders a white line between points (226, 45) and (202, 143).
; PLAN: r0=226(x1), r1=45(y1), r2=202(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 45
LDI r2, 202
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
