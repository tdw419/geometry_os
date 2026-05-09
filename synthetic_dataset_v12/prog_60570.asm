; DESCRIPTION: Composite: Creates a cyan circular shape at (96, 97) with radius 77 then Places a cyan line segment connecting (59, 239) to (90, 92).
; PLAN: r0=96(x), r1=97(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=59(x1), r6=239(y1), r7=90(x2), r8=92(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 97
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 59
LDI r6, 239
LDI r7, 90
LDI r8, 92
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
