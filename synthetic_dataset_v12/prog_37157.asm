; DESCRIPTION: Composite: Renders a cyan line between points (124, 231) and (506, 64) then Creates a white rectangular region at (397, 27) spanning 69 by 11 pixels then Places a magenta dot at position (246, 156).
; PLAN: r0=124(x1), r1=231(y1), r2=506(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=397(x), r6=27(y), r7=69(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=246(x), r11=156(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 124
LDI r1, 231
LDI r2, 506
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 397
LDI r6, 27
LDI r7, 69
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 156
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
