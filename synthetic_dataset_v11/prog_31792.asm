; DESCRIPTION: Renders a cyan line between points (243, 160) and (18, 235).
; PLAN: r0=243(x1), r1=160(y1), r2=18(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 160
LDI r2, 18
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
