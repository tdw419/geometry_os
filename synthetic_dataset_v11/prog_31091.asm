; DESCRIPTION: Renders a cyan line between points (176, 166) and (69, 132).
; PLAN: r0=176(x1), r1=166(y1), r2=69(x2), r3=132(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 166
LDI r2, 69
LDI r3, 132
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
