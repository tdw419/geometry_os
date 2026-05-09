; DESCRIPTION: Renders a cyan line between points (92, 44) and (340, 131).
; PLAN: r0=92(x1), r1=44(y1), r2=340(x2), r3=131(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 44
LDI r2, 340
LDI r3, 131
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
