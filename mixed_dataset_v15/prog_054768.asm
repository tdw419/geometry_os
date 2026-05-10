; DESCRIPTION: Places a red line segment connecting (488, 160) to (479, 74).
; PLAN: r0=488(x1), r1=160(y1), r2=479(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 160
LDI r2, 479
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
