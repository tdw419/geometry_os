; DESCRIPTION: Draws a cyan line from (246, 173) to (76, 55).
; PLAN: r0=246(x1), r1=173(y1), r2=76(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 173
LDI r2, 76
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
