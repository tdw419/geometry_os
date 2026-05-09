; DESCRIPTION: Renders a black line between points (257, 173) and (146, 55).
; PLAN: r0=257(x1), r1=173(y1), r2=146(x2), r3=55(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 173
LDI r2, 146
LDI r3, 55
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
