; DESCRIPTION: Renders a cyan line between points (232, 234) and (421, 198).
; PLAN: r0=232(x1), r1=234(y1), r2=421(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 234
LDI r2, 421
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
