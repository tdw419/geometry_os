; DESCRIPTION: Places a cyan line segment connecting (340, 39) to (175, 223).
; PLAN: r0=340(x1), r1=39(y1), r2=175(x2), r3=223(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 39
LDI r2, 175
LDI r3, 223
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
