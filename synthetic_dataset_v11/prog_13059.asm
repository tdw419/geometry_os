; DESCRIPTION: Renders a green line between points (79, 242) and (206, 174).
; PLAN: r0=79(x1), r1=242(y1), r2=206(x2), r3=174(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 242
LDI r2, 206
LDI r3, 174
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
