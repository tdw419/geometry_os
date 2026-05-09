; DESCRIPTION: Draws a cyan line from (203, 234) to (212, 182).
; PLAN: r0=203(x1), r1=234(y1), r2=212(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 234
LDI r2, 212
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
