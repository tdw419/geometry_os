; DESCRIPTION: Draws a cyan line from (160, 224) to (67, 173).
; PLAN: r0=160(x1), r1=224(y1), r2=67(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 224
LDI r2, 67
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
