; DESCRIPTION: Composite: Sets a single purple pixel at (81, 174) then Renders a orange box of size 76x42 starting at (202, 184).
; PLAN: r0=81(x), r1=174(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=202(x), r6=184(y), r7=76(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 174
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 202
LDI r6, 184
LDI r7, 76
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
