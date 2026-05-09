; DESCRIPTION: Composite: Places a magenta line segment connecting (77, 166) to (30, 189) then Places a cyan 14x28 rectangle at position (23, 76).
; PLAN: r0=77(x1), r1=166(y1), r2=30(x2), r3=189(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=23(x), r6=76(y), r7=14(width), r8=28(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 77
LDI r1, 166
LDI r2, 30
LDI r3, 189
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 76
LDI r7, 14
LDI r8, 28
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
