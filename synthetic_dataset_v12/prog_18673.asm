; DESCRIPTION: Draws a green line from (214, 245) to (212, 215).
; PLAN: r0=214(x1), r1=245(y1), r2=212(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 245
LDI r2, 212
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
