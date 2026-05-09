; DESCRIPTION: Draws a cyan line from (353, 240) to (233, 32).
; PLAN: r0=353(x1), r1=240(y1), r2=233(x2), r3=32(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 240
LDI r2, 233
LDI r3, 32
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
