; DESCRIPTION: Draws a cyan line from (434, 66) to (488, 148).
; PLAN: r0=434(x1), r1=66(y1), r2=488(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 66
LDI r2, 488
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
