; DESCRIPTION: Composite: Places a yellow dot at position (142, 164) then Places a orange 59x112 rectangle at position (1, 98).
; PLAN: r0=142(x), r1=164(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=1(x), r6=98(y), r7=59(width), r8=112(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 142
LDI r1, 164
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 1
LDI r6, 98
LDI r7, 59
LDI r8, 112
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
