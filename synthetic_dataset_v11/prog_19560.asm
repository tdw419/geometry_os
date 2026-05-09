; DESCRIPTION: Draws a green line from (252, 171) to (245, 195).
; PLAN: r0=252(x1), r1=171(y1), r2=245(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 171
LDI r2, 245
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
