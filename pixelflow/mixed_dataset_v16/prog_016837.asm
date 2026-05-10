; DESCRIPTION: Draws a blue line from (218, 67) to (16, 111).
; PLAN: r0=218(x1), r1=67(y1), r2=16(x2), r3=111(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 67
LDI r2, 16
LDI r3, 111
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
