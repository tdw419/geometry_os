; DESCRIPTION: Places a cyan line segment connecting (386, 122) to (168, 222).
; PLAN: r0=386(x1), r1=122(y1), r2=168(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 122
LDI r2, 168
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
