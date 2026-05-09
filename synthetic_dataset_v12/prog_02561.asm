; DESCRIPTION: Composite: Places a yellow circle of radius 34 at center (415, 53) then Creates a cyan rectangular region at (202, 35) spanning 68 by 56 pixels.
; PLAN: r0=415(x), r1=53(y), r2=34(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=35(y), r7=68(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 53
LDI r2, 34
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 35
LDI r7, 68
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
