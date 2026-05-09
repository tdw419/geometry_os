; DESCRIPTION: Places a cyan line segment connecting (152, 193) to (392, 28).
; PLAN: r0=152(x1), r1=193(y1), r2=392(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 193
LDI r2, 392
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
