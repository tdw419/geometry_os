; DESCRIPTION: Draws a cyan line from (482, 78) to (417, 117).
; PLAN: r0=482(x1), r1=78(y1), r2=417(x2), r3=117(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 78
LDI r2, 417
LDI r3, 117
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
