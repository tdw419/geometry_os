; DESCRIPTION: Draws a yellow line from (247, 242) to (173, 146).
; PLAN: r0=247(x1), r1=242(y1), r2=173(x2), r3=146(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 242
LDI r2, 173
LDI r3, 146
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
