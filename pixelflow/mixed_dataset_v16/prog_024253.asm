; DESCRIPTION: Composite: Places a black circle of radius 61 at center (142, 171) then Places a black 83x84 rectangle at position (352, 84).
; PLAN: r0=142(x), r1=171(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=84(y), r7=83(width), r8=84(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 171
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 84
LDI r7, 83
LDI r8, 84
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
