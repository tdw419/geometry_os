; DESCRIPTION: Composite: . Then Places a red circle of radius 55 at center (152, 76). Then Places a magenta line segment connecting (48, 221) to (213, 163).
; PLAN: r0=152(x), r1=76(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=48(x1), r1=221(y1), r2=213(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red circle of radius 55 at center (152, 76).
; PLAN: r0=152(x), r1=76(y), r2=55(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 152
LDI r1, 76
LDI r2, 55
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (48, 221) to (213, 163).
; PLAN: r0=48(x1), r1=221(y1), r2=213(x2), r3=163(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 221
LDI r2, 213
LDI r3, 163
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
