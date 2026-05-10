; DESCRIPTION: Renders a cyan line between points (436, 114) and (337, 113).
; PLAN: r0=436(x1), r1=114(y1), r2=337(x2), r3=113(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 114
LDI r2, 337
LDI r3, 113
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
