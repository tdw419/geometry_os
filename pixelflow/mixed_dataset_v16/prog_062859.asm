; DESCRIPTION: Renders a black line between points (28, 150) and (193, 215).
; PLAN: r0=28(x1), r1=150(y1), r2=193(x2), r3=215(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 150
LDI r2, 193
LDI r3, 215
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
