; DESCRIPTION: Renders a white line between points (269, 228) and (73, 178).
; PLAN: r0=269(x1), r1=228(y1), r2=73(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 228
LDI r2, 73
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
