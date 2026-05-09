; DESCRIPTION: Draws a green line from (160, 16) to (340, 64).
; PLAN: r0=160(x1), r1=16(y1), r2=340(x2), r3=64(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 16
LDI r2, 340
LDI r3, 64
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
