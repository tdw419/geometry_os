; DESCRIPTION: Draws a cyan line from (480, 71) to (509, 252).
; PLAN: r0=480(x1), r1=71(y1), r2=509(x2), r3=252(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 71
LDI r2, 509
LDI r3, 252
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
