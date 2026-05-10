; DESCRIPTION: Draws a red line from (488, 64) to (42, 11).
; PLAN: r0=488(x1), r1=64(y1), r2=42(x2), r3=11(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 64
LDI r2, 42
LDI r3, 11
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
