; DESCRIPTION: Renders a white line between points (295, 234) and (281, 149).
; PLAN: r0=295(x1), r1=234(y1), r2=281(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 234
LDI r2, 281
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
