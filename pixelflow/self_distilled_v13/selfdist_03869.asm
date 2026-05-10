; DESCRIPTION: Draws a cyan line from (32, 35) to (353, 60).
; PLAN: r0=32(x1), r1=35(y1), r2=353(x2), r3=60(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 35
LDI r2, 353
LDI r3, 60
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
