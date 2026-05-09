; DESCRIPTION: Draws a cyan line from (290, 28) to (324, 210).
; PLAN: r0=290(x1), r1=28(y1), r2=324(x2), r3=210(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 28
LDI r2, 324
LDI r3, 210
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
