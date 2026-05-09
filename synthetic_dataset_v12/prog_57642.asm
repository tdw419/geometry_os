; DESCRIPTION: Draws a black line from (417, 128) to (48, 143).
; PLAN: r0=417(x1), r1=128(y1), r2=48(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 128
LDI r2, 48
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
