; DESCRIPTION: Renders a magenta line between points (213, 142) and (412, 111).
; PLAN: r0=213(x1), r1=142(y1), r2=412(x2), r3=111(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 142
LDI r2, 412
LDI r3, 111
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
