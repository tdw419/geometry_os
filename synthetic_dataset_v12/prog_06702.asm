; DESCRIPTION: Draws a yellow line from (173, 129) to (253, 16).
; PLAN: r0=173(x1), r1=129(y1), r2=253(x2), r3=16(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 129
LDI r2, 253
LDI r3, 16
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
