; DESCRIPTION: Draws a green line from (82, 242) to (153, 51).
; PLAN: r0=82(x1), r1=242(y1), r2=153(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 242
LDI r2, 153
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
