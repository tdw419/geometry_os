; DESCRIPTION: Places a red circle of radius 80 at center (127, 113).
; PLAN: r0=127(x), r1=113(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 127
LDI r1, 113
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
