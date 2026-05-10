; DESCRIPTION: Draws a cyan line from (4, 3) to (510, 234).
; PLAN: r0=4(x1), r1=3(y1), r2=510(x2), r3=234(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 3
LDI r2, 510
LDI r3, 234
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
