; DESCRIPTION: Places a cyan line segment connecting (479, 96) to (224, 85).
; PLAN: r0=479(x1), r1=96(y1), r2=224(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 96
LDI r2, 224
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
