; DESCRIPTION: Composite: . Then Places a green line segment connecting (67, 245) to (191, 104). Then Renders a cyan disk with center (178, 152) and radius 55.
; PLAN: r0=67(x1), r1=245(y1), r2=191(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=178(x), r1=152(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green line segment connecting (67, 245) to (191, 104).
; PLAN: r0=67(x1), r1=245(y1), r2=191(x2), r3=104(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 245
LDI r2, 191
LDI r3, 104
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (178, 152) and radius 55.
; PLAN: r0=178(x), r1=152(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 152
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
