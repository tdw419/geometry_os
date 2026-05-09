; DESCRIPTION: Renders a orange line between points (76, 242) and (284, 204).
; PLAN: r0=76(x1), r1=242(y1), r2=284(x2), r3=204(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 242
LDI r2, 284
LDI r3, 204
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
