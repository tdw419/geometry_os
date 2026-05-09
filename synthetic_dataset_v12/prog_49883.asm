; DESCRIPTION: Draws a cyan line from (71, 129) to (203, 53).
; PLAN: r0=71(x1), r1=129(y1), r2=203(x2), r3=53(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 129
LDI r2, 203
LDI r3, 53
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
