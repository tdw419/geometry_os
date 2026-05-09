; DESCRIPTION: Places a cyan line segment connecting (482, 94) to (446, 241).
; PLAN: r0=482(x1), r1=94(y1), r2=446(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 94
LDI r2, 446
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
