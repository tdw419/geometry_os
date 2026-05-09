; DESCRIPTION: Draws a cyan line from (285, 25) to (210, 207).
; PLAN: r0=285(x1), r1=25(y1), r2=210(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 25
LDI r2, 210
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
