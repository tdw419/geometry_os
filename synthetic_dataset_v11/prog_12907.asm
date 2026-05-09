; DESCRIPTION: Places a cyan line segment connecting (239, 96) to (165, 169).
; PLAN: r0=239(x1), r1=96(y1), r2=165(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 96
LDI r2, 165
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
