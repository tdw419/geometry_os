; DESCRIPTION: Draws a yellow line from (27, 149) to (87, 214).
; PLAN: r0=27(x1), r1=149(y1), r2=87(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 149
LDI r2, 87
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
