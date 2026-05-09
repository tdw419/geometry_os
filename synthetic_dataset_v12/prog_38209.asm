; DESCRIPTION: Renders a orange line between points (327, 208) and (271, 50).
; PLAN: r0=327(x1), r1=208(y1), r2=271(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 208
LDI r2, 271
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
