; DESCRIPTION: Draws a cyan line from (24, 251) to (346, 176).
; PLAN: r0=24(x1), r1=251(y1), r2=346(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 251
LDI r2, 346
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
