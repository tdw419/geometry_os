; DESCRIPTION: Renders a cyan line between points (175, 45) and (105, 56).
; PLAN: r0=175(x1), r1=45(y1), r2=105(x2), r3=56(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 45
LDI r2, 105
LDI r3, 56
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
