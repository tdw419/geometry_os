; DESCRIPTION: Draws a cyan line from (209, 22) to (94, 71).
; PLAN: r0=209(x1), r1=22(y1), r2=94(x2), r3=71(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 22
LDI r2, 94
LDI r3, 71
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
