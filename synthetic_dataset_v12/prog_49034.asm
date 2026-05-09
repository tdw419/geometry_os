; DESCRIPTION: Renders a black line between points (413, 215) and (361, 128).
; PLAN: r0=413(x1), r1=215(y1), r2=361(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 215
LDI r2, 361
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
