; DESCRIPTION: Renders a red line between points (401, 146) and (407, 192).
; PLAN: r0=401(x1), r1=146(y1), r2=407(x2), r3=192(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 146
LDI r2, 407
LDI r3, 192
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
