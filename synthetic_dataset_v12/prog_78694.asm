; DESCRIPTION: Places a cyan line segment connecting (240, 224) to (393, 153).
; PLAN: r0=240(x1), r1=224(y1), r2=393(x2), r3=153(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 224
LDI r2, 393
LDI r3, 153
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
