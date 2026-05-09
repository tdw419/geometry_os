; DESCRIPTION: Renders a black line between points (220, 7) and (295, 242).
; PLAN: r0=220(x1), r1=7(y1), r2=295(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 7
LDI r2, 295
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
