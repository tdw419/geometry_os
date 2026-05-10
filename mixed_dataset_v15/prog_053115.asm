; DESCRIPTION: Composite: Places a cyan line segment connecting (226, 99) to (364, 255) then Renders a white box of size 63x56 starting at (245, 134).
; PLAN: r0=226(x1), r1=99(y1), r2=364(x2), r3=255(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=134(y), r7=63(width), r8=56(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 99
LDI r2, 364
LDI r3, 255
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 134
LDI r7, 63
LDI r8, 56
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
