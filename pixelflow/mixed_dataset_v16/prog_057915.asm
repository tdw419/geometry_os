; DESCRIPTION: Places a cyan line segment connecting (410, 154) to (190, 28).
; PLAN: r0=410(x1), r1=154(y1), r2=190(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 154
LDI r2, 190
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
