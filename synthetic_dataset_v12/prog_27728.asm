; DESCRIPTION: Renders a cyan line between points (435, 92) and (317, 240).
; PLAN: r0=435(x1), r1=92(y1), r2=317(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 92
LDI r2, 317
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
