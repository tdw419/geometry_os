; DESCRIPTION: Composite: . Then Creates a cyan circular shape at (116, 35) with radius 31. Then Draws a cyan line from (160, 172) to (108, 5).
; PLAN: r0=116(x), r1=35(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=160(x1), r1=172(y1), r2=108(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan circular shape at (116, 35) with radius 31.
; PLAN: r0=116(x), r1=35(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 116
LDI r1, 35
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan line from (160, 172) to (108, 5).
; PLAN: r0=160(x1), r1=172(y1), r2=108(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 172
LDI r2, 108
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
