; DESCRIPTION: Renders a red line between points (340, 226) and (284, 153).
; PLAN: r0=340(x1), r1=226(y1), r2=284(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 226
LDI r2, 284
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
