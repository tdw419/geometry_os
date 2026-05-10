; DESCRIPTION: Draws a green line from (326, 248) to (330, 146).
; PLAN: r0=326(x1), r1=248(y1), r2=330(x2), r3=146(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 248
LDI r2, 330
LDI r3, 146
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
