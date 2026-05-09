; DESCRIPTION: Places a cyan line segment connecting (213, 122) to (242, 250).
; PLAN: r0=213(x1), r1=122(y1), r2=242(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 122
LDI r2, 242
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
