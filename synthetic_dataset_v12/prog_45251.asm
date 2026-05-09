; DESCRIPTION: Draws a cyan line from (152, 205) to (307, 25).
; PLAN: r0=152(x1), r1=205(y1), r2=307(x2), r3=25(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 205
LDI r2, 307
LDI r3, 25
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
