; DESCRIPTION: Renders a cyan line between points (275, 17) and (10, 187).
; PLAN: r0=275(x1), r1=17(y1), r2=10(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 17
LDI r2, 10
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
