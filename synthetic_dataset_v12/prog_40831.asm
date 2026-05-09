; DESCRIPTION: Places a cyan line segment connecting (435, 41) to (482, 190).
; PLAN: r0=435(x1), r1=41(y1), r2=482(x2), r3=190(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 435
LDI r1, 41
LDI r2, 482
LDI r3, 190
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
