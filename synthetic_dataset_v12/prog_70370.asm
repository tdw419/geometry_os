; DESCRIPTION: Draws a cyan line from (247, 16) to (422, 224).
; PLAN: r0=247(x1), r1=16(y1), r2=422(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 16
LDI r2, 422
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
