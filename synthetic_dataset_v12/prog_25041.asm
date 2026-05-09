; DESCRIPTION: Composite: Sets a single magenta pixel at (385, 133) then Creates a red rectangular region at (410, 32) spanning 97 by 60 pixels then Places a blue circle of radius 10 at center (42, 130).
; PLAN: r0=385(x), r1=133(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=32(y), r7=97(width), r8=60(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=42(x), r11=130(y), r12=10(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 385
LDI r1, 133
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 410
LDI r6, 32
LDI r7, 97
LDI r8, 60
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 130
LDI r12, 10
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
