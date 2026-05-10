; DESCRIPTION: Draws a green line from (481, 190) to (284, 67).
; PLAN: r0=481(x1), r1=190(y1), r2=284(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 190
LDI r2, 284
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
