; DESCRIPTION: Draws a green line from (68, 202) to (2, 27).
; PLAN: r0=68(x1), r1=202(y1), r2=2(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 202
LDI r2, 2
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
