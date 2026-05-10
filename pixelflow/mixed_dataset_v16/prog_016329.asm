; DESCRIPTION: Renders a cyan circular shape at (284, 0) with radius 38.
; PLAN: r0=284(x), r1=0(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 284
LDI r1, 0
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
