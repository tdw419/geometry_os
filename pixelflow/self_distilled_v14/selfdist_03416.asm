; DESCRIPTION: Draws a cyan line from (333, 18) to (141, 174).
; PLAN: r0=333(x1), r1=18(y1), r2=141(x2), r3=174(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 18
LDI r2, 141
LDI r3, 174
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
