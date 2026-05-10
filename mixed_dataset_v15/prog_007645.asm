; DESCRIPTION: Renders a cyan line between points (123, 107) and (95, 0).
; PLAN: r0=123(x1), r1=107(y1), r2=95(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 107
LDI r2, 95
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
