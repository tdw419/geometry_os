; DESCRIPTION: Draws a cyan line from (69, 233) to (430, 228).
; PLAN: r0=69(x1), r1=233(y1), r2=430(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 233
LDI r2, 430
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
