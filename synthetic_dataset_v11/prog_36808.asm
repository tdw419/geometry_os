; DESCRIPTION: Renders a cyan line between points (226, 101) and (242, 197).
; PLAN: r0=226(x1), r1=101(y1), r2=242(x2), r3=197(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 101
LDI r2, 242
LDI r3, 197
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
