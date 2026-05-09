; DESCRIPTION: Draws a cyan line from (82, 146) to (447, 235).
; PLAN: r0=82(x1), r1=146(y1), r2=447(x2), r3=235(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 146
LDI r2, 447
LDI r3, 235
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
