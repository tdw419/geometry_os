; DESCRIPTION: Composite: Places a cyan dot at position (42, 228) then Draws a orange rectangle at (187, 211) with width 35 and height 21.
; PLAN: r0=42(x), r1=228(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=187(x), r6=211(y), r7=35(width), r8=21(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 42
LDI r1, 228
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 187
LDI r6, 211
LDI r7, 35
LDI r8, 21
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
