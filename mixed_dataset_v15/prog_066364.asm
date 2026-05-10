; DESCRIPTION: Composite: Places a magenta dot at position (510, 13) then Renders a white box of size 65x42 starting at (166, 12).
; PLAN: r0=510(x), r1=13(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=166(x), r6=12(y), r7=65(width), r8=42(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 510
LDI r1, 13
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 12
LDI r7, 65
LDI r8, 42
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
