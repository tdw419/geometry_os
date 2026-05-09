; DESCRIPTION: Draws a cyan line from (308, 98) to (475, 250).
; PLAN: r0=308(x1), r1=98(y1), r2=475(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 98
LDI r2, 475
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
