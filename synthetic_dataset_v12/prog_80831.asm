; DESCRIPTION: Renders a purple disk with center (284, 129) and radius 50.
; PLAN: r0=284(x), r1=129(y), r2=50(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 129
LDI r2, 50
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
