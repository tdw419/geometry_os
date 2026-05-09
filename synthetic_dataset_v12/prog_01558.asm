; DESCRIPTION: Renders a yellow line between points (356, 228) and (393, 172).
; PLAN: r0=356(x1), r1=228(y1), r2=393(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 228
LDI r2, 393
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
