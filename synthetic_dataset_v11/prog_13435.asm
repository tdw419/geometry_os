; DESCRIPTION: Renders a red line between points (108, 173) and (187, 114).
; PLAN: r0=108(x1), r1=173(y1), r2=187(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 173
LDI r2, 187
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
