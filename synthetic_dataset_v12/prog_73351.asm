; DESCRIPTION: Places a cyan line segment connecting (237, 203) to (446, 222).
; PLAN: r0=237(x1), r1=203(y1), r2=446(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 203
LDI r2, 446
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
