; DESCRIPTION: Draws a cyan line from (384, 214) to (235, 3).
; PLAN: r0=384(x1), r1=214(y1), r2=235(x2), r3=3(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 214
LDI r2, 235
LDI r3, 3
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
