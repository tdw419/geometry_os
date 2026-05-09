; DESCRIPTION: Draws a cyan line from (192, 239) to (67, 205).
; PLAN: r0=192(x1), r1=239(y1), r2=67(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 239
LDI r2, 67
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
