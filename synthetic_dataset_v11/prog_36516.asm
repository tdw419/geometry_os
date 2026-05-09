; DESCRIPTION: Draws a cyan line from (48, 203) to (161, 208).
; PLAN: r0=48(x1), r1=203(y1), r2=161(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 203
LDI r2, 161
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
