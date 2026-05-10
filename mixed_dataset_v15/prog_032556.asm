; DESCRIPTION: Draws a cyan line from (165, 235) to (480, 49).
; PLAN: r0=165(x1), r1=235(y1), r2=480(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 235
LDI r2, 480
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
