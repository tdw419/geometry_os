; DESCRIPTION: Composite: Places a green dot at position (406, 122) then Creates a red rectangular region at (197, 7) spanning 84 by 73 pixels.
; PLAN: r0=406(x), r1=122(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=7(y), r7=84(width), r8=73(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 122
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 197
LDI r6, 7
LDI r7, 84
LDI r8, 73
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
