; DESCRIPTION: Renders a black line between points (480, 228) and (179, 98).
; PLAN: r0=480(x1), r1=228(y1), r2=179(x2), r3=98(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 228
LDI r2, 179
LDI r3, 98
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
