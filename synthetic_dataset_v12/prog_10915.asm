; DESCRIPTION: Composite: Renders a cyan box of size 27x12 starting at (105, 226) then Places a white line segment connecting (333, 116) to (23, 143).
; PLAN: r0=105(x), r1=226(y), r2=27(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=333(x1), r6=116(y1), r7=23(x2), r8=143(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 105
LDI r1, 226
LDI r2, 27
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 333
LDI r6, 116
LDI r7, 23
LDI r8, 143
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
