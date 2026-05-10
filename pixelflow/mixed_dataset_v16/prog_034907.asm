; DESCRIPTION: Draws a cyan line from (308, 236) to (418, 142).
; PLAN: r0=308(x1), r1=236(y1), r2=418(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 236
LDI r2, 418
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
