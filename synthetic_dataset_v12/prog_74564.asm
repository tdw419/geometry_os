; DESCRIPTION: Renders a green line between points (138, 126) and (294, 149).
; PLAN: r0=138(x1), r1=126(y1), r2=294(x2), r3=149(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 126
LDI r2, 294
LDI r3, 149
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
