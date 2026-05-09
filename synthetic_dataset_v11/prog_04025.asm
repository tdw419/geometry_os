; DESCRIPTION: Draws a orange line from (168, 129) to (215, 232).
; PLAN: r0=168(x1), r1=129(y1), r2=215(x2), r3=232(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 129
LDI r2, 215
LDI r3, 232
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
