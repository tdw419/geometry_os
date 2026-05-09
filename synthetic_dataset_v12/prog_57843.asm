; DESCRIPTION: Draws a cyan line from (153, 241) to (504, 224).
; PLAN: r0=153(x1), r1=241(y1), r2=504(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 241
LDI r2, 504
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
