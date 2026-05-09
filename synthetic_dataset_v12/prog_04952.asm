; DESCRIPTION: Draws a cyan line from (113, 234) to (402, 1).
; PLAN: r0=113(x1), r1=234(y1), r2=402(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 234
LDI r2, 402
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
