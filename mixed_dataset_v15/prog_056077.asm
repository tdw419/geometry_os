; DESCRIPTION: Draws a green line from (426, 245) to (411, 215).
; PLAN: r0=426(x1), r1=245(y1), r2=411(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 245
LDI r2, 411
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
