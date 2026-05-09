; DESCRIPTION: Renders a green line between points (242, 2) and (43, 125).
; PLAN: r0=242(x1), r1=2(y1), r2=43(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 2
LDI r2, 43
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
