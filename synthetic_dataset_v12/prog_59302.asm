; DESCRIPTION: Draws a cyan line from (76, 234) to (465, 37).
; PLAN: r0=76(x1), r1=234(y1), r2=465(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 234
LDI r2, 465
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
