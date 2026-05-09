; DESCRIPTION: Renders a yellow box of size 110x53 starting at (386, 111).
; PLAN: r0=386(x), r1=111(y), r2=110(width), r3=53(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 111
LDI r2, 110
LDI r3, 53
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
