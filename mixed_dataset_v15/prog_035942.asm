; DESCRIPTION: Draws a yellow line from (23, 244) to (215, 146).
; PLAN: r0=23(x1), r1=244(y1), r2=215(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 244
LDI r2, 215
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
