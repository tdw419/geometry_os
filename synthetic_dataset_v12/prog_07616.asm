; DESCRIPTION: Places a cyan line segment connecting (281, 115) to (493, 202).
; PLAN: r0=281(x1), r1=115(y1), r2=493(x2), r3=202(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 115
LDI r2, 493
LDI r3, 202
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
