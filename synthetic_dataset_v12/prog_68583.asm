; DESCRIPTION: Draws a green line from (402, 225) to (79, 27).
; PLAN: r0=402(x1), r1=225(y1), r2=79(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 225
LDI r2, 79
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
