; DESCRIPTION: Draws a magenta line from (202, 138) to (128, 213).
; PLAN: r0=202(x1), r1=138(y1), r2=128(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 138
LDI r2, 128
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
