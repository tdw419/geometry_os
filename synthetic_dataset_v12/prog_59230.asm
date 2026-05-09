; DESCRIPTION: Renders a yellow line between points (116, 249) and (197, 171).
; PLAN: r0=116(x1), r1=249(y1), r2=197(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 249
LDI r2, 197
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
