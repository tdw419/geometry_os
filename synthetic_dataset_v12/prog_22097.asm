; DESCRIPTION: Renders a green line between points (353, 203) and (465, 231).
; PLAN: r0=353(x1), r1=203(y1), r2=465(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 203
LDI r2, 465
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
