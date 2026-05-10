; DESCRIPTION: Draws a cyan line from (421, 226) to (491, 198).
; PLAN: r0=421(x1), r1=226(y1), r2=491(x2), r3=198(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 226
LDI r2, 491
LDI r3, 198
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
