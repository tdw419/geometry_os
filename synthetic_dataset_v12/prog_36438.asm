; DESCRIPTION: Draws a green line from (422, 198) to (242, 215).
; PLAN: r0=422(x1), r1=198(y1), r2=242(x2), r3=215(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 198
LDI r2, 242
LDI r3, 215
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
