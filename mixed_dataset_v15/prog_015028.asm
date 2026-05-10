; DESCRIPTION: Places a cyan line segment connecting (279, 186) to (313, 242).
; PLAN: r0=279(x1), r1=186(y1), r2=313(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 186
LDI r2, 313
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
