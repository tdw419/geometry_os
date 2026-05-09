; DESCRIPTION: Renders a black line between points (173, 109) and (82, 126).
; PLAN: r0=173(x1), r1=109(y1), r2=82(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 109
LDI r2, 82
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
