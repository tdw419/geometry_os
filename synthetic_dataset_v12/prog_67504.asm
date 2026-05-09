; DESCRIPTION: Composite: Creates a blue circular shape at (135, 120) with radius 61 then Renders a cyan line between points (221, 109) and (277, 173).
; PLAN: r0=135(x), r1=120(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x1), r6=109(y1), r7=277(x2), r8=173(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 135
LDI r1, 120
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 109
LDI r7, 277
LDI r8, 173
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
