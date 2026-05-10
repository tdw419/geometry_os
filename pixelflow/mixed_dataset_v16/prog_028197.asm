; DESCRIPTION: Places a cyan line segment connecting (446, 187) to (323, 209).
; PLAN: r0=446(x1), r1=187(y1), r2=323(x2), r3=209(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 187
LDI r2, 323
LDI r3, 209
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
