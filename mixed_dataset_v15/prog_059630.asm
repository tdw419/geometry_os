; DESCRIPTION: Places a cyan line segment connecting (152, 167) to (465, 239).
; PLAN: r0=152(x1), r1=167(y1), r2=465(x2), r3=239(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 167
LDI r2, 465
LDI r3, 239
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
