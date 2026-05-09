; DESCRIPTION: Composite: Places a black dot at position (38, 114) then Places a green 101x92 rectangle at position (211, 34).
; PLAN: r0=38(x), r1=114(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=211(x), r6=34(y), r7=101(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 38
LDI r1, 114
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 211
LDI r6, 34
LDI r7, 101
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
