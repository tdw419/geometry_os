; DESCRIPTION: Renders a black line between points (398, 126) and (309, 171).
; PLAN: r0=398(x1), r1=126(y1), r2=309(x2), r3=171(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 126
LDI r2, 309
LDI r3, 171
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
