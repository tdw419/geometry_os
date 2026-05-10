; DESCRIPTION: Renders a magenta line between points (445, 111) and (87, 113).
; PLAN: r0=445(x1), r1=111(y1), r2=87(x2), r3=113(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 111
LDI r2, 87
LDI r3, 113
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
