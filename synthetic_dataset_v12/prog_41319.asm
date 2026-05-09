; DESCRIPTION: Places a cyan line segment connecting (304, 27) to (392, 222).
; PLAN: r0=304(x1), r1=27(y1), r2=392(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 27
LDI r2, 392
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
