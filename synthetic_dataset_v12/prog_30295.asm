; DESCRIPTION: Composite: Renders a red box of size 105x38 starting at (42, 131) then Places a blue dot at position (475, 68).
; PLAN: r0=42(x), r1=131(y), r2=105(width), r3=38(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=475(x), r6=68(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 131
LDI r2, 105
LDI r3, 38
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 475
LDI r6, 68
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
