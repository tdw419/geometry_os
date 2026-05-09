; DESCRIPTION: Renders a white line between points (57, 202) and (228, 228).
; PLAN: r0=57(x1), r1=202(y1), r2=228(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 202
LDI r2, 228
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
