; DESCRIPTION: Places a cyan line segment connecting (143, 234) to (236, 107).
; PLAN: r0=143(x1), r1=234(y1), r2=236(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 234
LDI r2, 236
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
