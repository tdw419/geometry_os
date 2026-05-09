; DESCRIPTION: Renders a cyan line between points (245, 40) and (102, 202).
; PLAN: r0=245(x1), r1=40(y1), r2=102(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 40
LDI r2, 102
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
