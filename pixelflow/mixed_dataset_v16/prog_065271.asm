; DESCRIPTION: Composite: Places a magenta dot at position (48, 208) then Creates a green rectangular region at (422, 42) spanning 54 by 55 pixels then Draws a cyan circle centered at (273, 146) with radius 73.
; PLAN: r0=48(x), r1=208(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=42(y), r7=54(width), r8=55(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=273(x), r11=146(y), r12=73(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 48
LDI r1, 208
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 422
LDI r6, 42
LDI r7, 54
LDI r8, 55
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 146
LDI r12, 73
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
