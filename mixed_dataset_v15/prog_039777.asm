; DESCRIPTION: Composite: Draws a cyan circle centered at (398, 151) with radius 67 then Draws a magenta line from (262, 137) to (154, 42).
; PLAN: r0=398(x), r1=151(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=262(x1), r6=137(y1), r7=154(x2), r8=42(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 398
LDI r1, 151
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 262
LDI r6, 137
LDI r7, 154
LDI r8, 42
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
