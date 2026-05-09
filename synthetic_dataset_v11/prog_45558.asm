; DESCRIPTION: Renders a black line between points (113, 50) and (242, 132).
; PLAN: r0=113(x1), r1=50(y1), r2=242(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 50
LDI r2, 242
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
