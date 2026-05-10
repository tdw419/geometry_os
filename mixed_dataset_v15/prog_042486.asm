; DESCRIPTION: Draws a green line from (284, 36) to (215, 5).
; PLAN: r0=284(x1), r1=36(y1), r2=215(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 36
LDI r2, 215
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
