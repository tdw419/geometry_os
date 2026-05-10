; DESCRIPTION: Draws a green line from (27, 154) to (434, 17).
; PLAN: r0=27(x1), r1=154(y1), r2=434(x2), r3=17(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 154
LDI r2, 434
LDI r3, 17
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
