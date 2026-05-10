; DESCRIPTION: Places a cyan line segment connecting (492, 209) to (353, 22).
; PLAN: r0=492(x1), r1=209(y1), r2=353(x2), r3=22(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 209
LDI r2, 353
LDI r3, 22
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
