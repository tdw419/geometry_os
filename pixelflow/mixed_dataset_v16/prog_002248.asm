; DESCRIPTION: Draws a cyan line from (108, 190) to (417, 224).
; PLAN: r0=108(x1), r1=190(y1), r2=417(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 190
LDI r2, 417
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
