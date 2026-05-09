; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (102, 73) with radius 55. Then Places a cyan line segment connecting (19, 246) to (122, 38).
; PLAN: r0=102(x), r1=73(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=19(x1), r1=246(y1), r2=122(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (102, 73) with radius 55.
; PLAN: r0=102(x), r1=73(y), r2=55(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 102
LDI r1, 73
LDI r2, 55
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a cyan line segment connecting (19, 246) to (122, 38).
; PLAN: r0=19(x1), r1=246(y1), r2=122(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 246
LDI r2, 122
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
