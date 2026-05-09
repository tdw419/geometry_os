; DESCRIPTION: Composite: Places a magenta line segment connecting (244, 163) to (224, 82) then Creates a cyan rectangular region at (249, 29) spanning 27 by 117 pixels.
; PLAN: r0=244(x1), r1=163(y1), r2=224(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=29(y), r7=27(width), r8=117(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 244
LDI r1, 163
LDI r2, 224
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 29
LDI r7, 27
LDI r8, 117
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
