; DESCRIPTION: Renders a magenta line between points (67, 163) and (479, 59).
; PLAN: r0=67(x1), r1=163(y1), r2=479(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 163
LDI r2, 479
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
