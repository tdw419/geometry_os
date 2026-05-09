; DESCRIPTION: Draws a cyan line from (53, 115) to (228, 38).
; PLAN: r0=53(x1), r1=115(y1), r2=228(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 115
LDI r2, 228
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
