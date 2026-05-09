; DESCRIPTION: Draws a red line from (392, 242) to (497, 237).
; PLAN: r0=392(x1), r1=242(y1), r2=497(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 242
LDI r2, 497
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
