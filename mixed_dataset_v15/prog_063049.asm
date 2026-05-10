; DESCRIPTION: Composite: Places a red dot at position (265, 142) then Renders a green box of size 68x74 starting at (292, 112).
; PLAN: r0=265(x), r1=142(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=112(y), r7=68(width), r8=74(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 265
LDI r1, 142
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 292
LDI r6, 112
LDI r7, 68
LDI r8, 74
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
