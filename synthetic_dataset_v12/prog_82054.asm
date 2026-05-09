; DESCRIPTION: Composite: Renders a yellow box of size 74x120 starting at (422, 5) then Renders a white line between points (169, 193) and (180, 82).
; PLAN: r0=422(x), r1=5(y), r2=74(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=169(x1), r6=193(y1), r7=180(x2), r8=82(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 422
LDI r1, 5
LDI r2, 74
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 169
LDI r6, 193
LDI r7, 180
LDI r8, 82
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
