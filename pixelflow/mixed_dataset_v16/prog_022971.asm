; DESCRIPTION: Places a cyan line segment connecting (194, 222) to (415, 42).
; PLAN: r0=194(x1), r1=222(y1), r2=415(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 222
LDI r2, 415
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
