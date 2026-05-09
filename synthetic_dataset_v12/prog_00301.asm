; DESCRIPTION: Draws a cyan line from (268, 239) to (339, 65).
; PLAN: r0=268(x1), r1=239(y1), r2=339(x2), r3=65(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 239
LDI r2, 339
LDI r3, 65
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
