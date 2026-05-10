; DESCRIPTION: Places a cyan line segment connecting (374, 20) to (242, 164).
; PLAN: r0=374(x1), r1=20(y1), r2=242(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 20
LDI r2, 242
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
