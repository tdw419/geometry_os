; DESCRIPTION: Draws a cyan line from (397, 34) to (242, 65).
; PLAN: r0=397(x1), r1=34(y1), r2=242(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 34
LDI r2, 242
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
