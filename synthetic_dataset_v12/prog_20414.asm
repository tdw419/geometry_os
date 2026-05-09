; DESCRIPTION: Draws a cyan line from (38, 47) to (481, 210).
; PLAN: r0=38(x1), r1=47(y1), r2=481(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 47
LDI r2, 481
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
