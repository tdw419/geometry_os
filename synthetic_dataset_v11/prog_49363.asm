; DESCRIPTION: Renders a yellow line between points (171, 240) and (60, 117).
; PLAN: r0=171(x1), r1=240(y1), r2=60(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 240
LDI r2, 60
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
