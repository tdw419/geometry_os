; DESCRIPTION: Draws a green line from (26, 27) to (237, 103).
; PLAN: r0=26(x1), r1=27(y1), r2=237(x2), r3=103(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 27
LDI r2, 237
LDI r3, 103
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
