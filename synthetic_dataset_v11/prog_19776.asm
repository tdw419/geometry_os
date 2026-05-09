; DESCRIPTION: Draws a cyan line from (228, 62) to (62, 182).
; PLAN: r0=228(x1), r1=62(y1), r2=62(x2), r3=182(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 62
LDI r2, 62
LDI r3, 182
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
