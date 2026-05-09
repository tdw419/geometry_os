; DESCRIPTION: Renders a black line between points (48, 30) and (410, 206).
; PLAN: r0=48(x1), r1=30(y1), r2=410(x2), r3=206(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 30
LDI r2, 410
LDI r3, 206
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
