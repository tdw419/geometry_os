; DESCRIPTION: Renders a black line between points (207, 237) and (295, 154).
; PLAN: r0=207(x1), r1=237(y1), r2=295(x2), r3=154(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 237
LDI r2, 295
LDI r3, 154
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
