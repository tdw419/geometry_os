; DESCRIPTION: Draws a cyan line from (127, 253) to (50, 28).
; PLAN: r0=127(x1), r1=253(y1), r2=50(x2), r3=28(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 253
LDI r2, 50
LDI r3, 28
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
