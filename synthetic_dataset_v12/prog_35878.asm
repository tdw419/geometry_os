; DESCRIPTION: Renders a orange line between points (386, 252) and (46, 213).
; PLAN: r0=386(x1), r1=252(y1), r2=46(x2), r3=213(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 252
LDI r2, 46
LDI r3, 213
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
