; DESCRIPTION: Renders a orange line between points (284, 243) and (446, 151).
; PLAN: r0=284(x1), r1=243(y1), r2=446(x2), r3=151(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 243
LDI r2, 446
LDI r3, 151
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
