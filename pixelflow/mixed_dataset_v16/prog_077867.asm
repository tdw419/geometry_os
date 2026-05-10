; DESCRIPTION: Renders a yellow line between points (342, 214) and (228, 240).
; PLAN: r0=342(x1), r1=214(y1), r2=228(x2), r3=240(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 214
LDI r2, 228
LDI r3, 240
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
