; DESCRIPTION: Places a cyan line segment connecting (492, 46) to (160, 208).
; PLAN: r0=492(x1), r1=46(y1), r2=160(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 46
LDI r2, 160
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
