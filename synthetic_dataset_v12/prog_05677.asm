; DESCRIPTION: Renders a yellow line between points (291, 242) and (197, 23).
; PLAN: r0=291(x1), r1=242(y1), r2=197(x2), r3=23(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 242
LDI r2, 197
LDI r3, 23
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
