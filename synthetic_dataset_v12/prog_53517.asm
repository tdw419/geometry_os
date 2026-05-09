; DESCRIPTION: Renders a cyan line between points (175, 36) and (53, 242).
; PLAN: r0=175(x1), r1=36(y1), r2=53(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 36
LDI r2, 53
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
