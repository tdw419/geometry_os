; DESCRIPTION: Renders a green line between points (46, 33) and (445, 203).
; PLAN: r0=46(x1), r1=33(y1), r2=445(x2), r3=203(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 33
LDI r2, 445
LDI r3, 203
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
