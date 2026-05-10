; DESCRIPTION: Draws a black line from (82, 236) to (245, 164).
; PLAN: r0=82(x1), r1=236(y1), r2=245(x2), r3=164(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 236
LDI r2, 245
LDI r3, 164
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
