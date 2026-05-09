; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (38, 72) to (5, 20). Then Places a yellow 24x112 rectangle at position (48, 139).
; PLAN: r0=38(x1), r1=72(y1), r2=5(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=48(x), r1=139(y), r2=24(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a yellow line segment connecting (38, 72) to (5, 20).
; PLAN: r0=38(x1), r1=72(y1), r2=5(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 72
LDI r2, 5
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a yellow 24x112 rectangle at position (48, 139).
; PLAN: r0=48(x), r1=139(y), r2=24(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 139
LDI r2, 24
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
