; DESCRIPTION: Renders a white line between points (21, 33) and (190, 174).
; PLAN: r0=21(x1), r1=33(y1), r2=190(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 33
LDI r2, 190
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
