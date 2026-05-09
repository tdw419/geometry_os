; DESCRIPTION: Places a green line segment connecting (488, 70) to (197, 253).
; PLAN: r0=488(x1), r1=70(y1), r2=197(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 70
LDI r2, 197
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
