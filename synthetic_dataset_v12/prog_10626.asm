; DESCRIPTION: Places a cyan line segment connecting (64, 205) to (152, 29).
; PLAN: r0=64(x1), r1=205(y1), r2=152(x2), r3=29(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 205
LDI r2, 152
LDI r3, 29
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
