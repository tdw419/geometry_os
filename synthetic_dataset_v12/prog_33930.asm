; DESCRIPTION: Draws a cyan line from (276, 248) to (476, 3).
; PLAN: r0=276(x1), r1=248(y1), r2=476(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 248
LDI r2, 476
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
