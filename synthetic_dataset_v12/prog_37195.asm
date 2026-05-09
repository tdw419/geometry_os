; DESCRIPTION: Draws a green line from (504, 166) to (294, 152).
; PLAN: r0=504(x1), r1=166(y1), r2=294(x2), r3=152(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 166
LDI r2, 294
LDI r3, 152
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
