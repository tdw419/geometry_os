; DESCRIPTION: Composite: Places a red dot at position (68, 85) then Places a yellow 96x76 rectangle at position (337, 81).
; PLAN: r0=68(x), r1=85(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=337(x), r6=81(y), r7=96(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 68
LDI r1, 85
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 337
LDI r6, 81
LDI r7, 96
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
