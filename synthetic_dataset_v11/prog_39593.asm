; DESCRIPTION: Draws a white line from (80, 226) to (242, 113).
; PLAN: r0=80(x1), r1=226(y1), r2=242(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 226
LDI r2, 242
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
