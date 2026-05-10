; DESCRIPTION: Renders a cyan line between points (69, 248) and (303, 102).
; PLAN: r0=69(x1), r1=248(y1), r2=303(x2), r3=102(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 248
LDI r2, 303
LDI r3, 102
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
