; DESCRIPTION: Draws a cyan line from (245, 63) to (486, 195).
; PLAN: r0=245(x1), r1=63(y1), r2=486(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 63
LDI r2, 486
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
