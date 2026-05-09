; DESCRIPTION: Draws a green line from (39, 109) to (254, 215).
; PLAN: r0=39(x1), r1=109(y1), r2=254(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 109
LDI r2, 254
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
