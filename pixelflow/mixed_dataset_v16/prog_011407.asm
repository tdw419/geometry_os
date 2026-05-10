; DESCRIPTION: Renders a cyan line segment connecting (354, 142) to (212, 70).
; PLAN: r0=354(x1), r1=142(y1), r2=212(x2), r3=70(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 142
LDI r2, 212
LDI r3, 70
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
