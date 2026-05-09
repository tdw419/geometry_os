; DESCRIPTION: Draws a cyan line from (413, 220) to (280, 20).
; PLAN: r0=413(x1), r1=220(y1), r2=280(x2), r3=20(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 220
LDI r2, 280
LDI r3, 20
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
