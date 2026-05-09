; DESCRIPTION: Renders a cyan line between points (277, 177) and (214, 96).
; PLAN: r0=277(x1), r1=177(y1), r2=214(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 177
LDI r2, 214
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
