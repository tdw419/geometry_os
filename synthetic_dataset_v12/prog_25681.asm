; DESCRIPTION: Renders a white line between points (174, 206) and (486, 242).
; PLAN: r0=174(x1), r1=206(y1), r2=486(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 206
LDI r2, 486
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
