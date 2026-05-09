; DESCRIPTION: Draws a cyan line from (30, 175) to (107, 202).
; PLAN: r0=30(x1), r1=175(y1), r2=107(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 175
LDI r2, 107
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
