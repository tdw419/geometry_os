; DESCRIPTION: Draws a white line from (215, 142) to (131, 242).
; PLAN: r0=215(x1), r1=142(y1), r2=131(x2), r3=242(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 142
LDI r2, 131
LDI r3, 242
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
