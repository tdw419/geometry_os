; DESCRIPTION: Renders a white line between points (294, 92) and (242, 96).
; PLAN: r0=294(x1), r1=92(y1), r2=242(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 92
LDI r2, 242
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
