; DESCRIPTION: Renders a cyan line between points (294, 14) and (277, 169).
; PLAN: r0=294(x1), r1=14(y1), r2=277(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 14
LDI r2, 277
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
