; DESCRIPTION: Draws a blue line from (81, 234) to (294, 27).
; PLAN: r0=81(x1), r1=234(y1), r2=294(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 234
LDI r2, 294
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
