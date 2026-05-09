; DESCRIPTION: Draws a white line from (20, 93) to (242, 238).
; PLAN: r0=20(x1), r1=93(y1), r2=242(x2), r3=238(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 93
LDI r2, 242
LDI r3, 238
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
