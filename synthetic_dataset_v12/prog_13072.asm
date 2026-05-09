; DESCRIPTION: Draws a cyan line from (279, 20) to (224, 218).
; PLAN: r0=279(x1), r1=20(y1), r2=224(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 20
LDI r2, 224
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
