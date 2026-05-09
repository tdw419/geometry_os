; DESCRIPTION: Places a cyan line segment connecting (0, 32) to (173, 65).
; PLAN: r0=0(x1), r1=32(y1), r2=173(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 32
LDI r2, 173
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
