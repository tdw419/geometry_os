; DESCRIPTION: Draws a magenta line from (290, 239) to (82, 210).
; PLAN: r0=290(x1), r1=239(y1), r2=82(x2), r3=210(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 239
LDI r2, 82
LDI r3, 210
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
