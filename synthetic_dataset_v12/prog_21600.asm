; DESCRIPTION: Draws a cyan line from (482, 142) to (254, 121).
; PLAN: r0=482(x1), r1=142(y1), r2=254(x2), r3=121(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 142
LDI r2, 254
LDI r3, 121
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
