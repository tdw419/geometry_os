; DESCRIPTION: Draws a cyan line from (221, 173) to (67, 39).
; PLAN: r0=221(x1), r1=173(y1), r2=67(x2), r3=39(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 173
LDI r2, 67
LDI r3, 39
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
