; DESCRIPTION: Composite: Places a orange line segment connecting (376, 126) to (242, 146) then Creates a cyan rectangular region at (394, 35) spanning 116 by 69 pixels.
; PLAN: r0=376(x1), r1=126(y1), r2=242(x2), r3=146(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=394(x), r6=35(y), r7=116(width), r8=69(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 376
LDI r1, 126
LDI r2, 242
LDI r3, 146
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 35
LDI r7, 116
LDI r8, 69
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
