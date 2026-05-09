; DESCRIPTION: Draws a cyan line from (127, 126) to (253, 125).
; PLAN: r0=127(x1), r1=126(y1), r2=253(x2), r3=125(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 126
LDI r2, 253
LDI r3, 125
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
