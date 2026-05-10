; DESCRIPTION: Renders a red line between points (243, 103) and (469, 27).
; PLAN: r0=243(x1), r1=103(y1), r2=469(x2), r3=27(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 103
LDI r2, 469
LDI r3, 27
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
