; DESCRIPTION: Composite: Places a black dot at position (223, 67) then Places a cyan 38x35 rectangle at position (37, 154).
; PLAN: r0=223(x), r1=67(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=37(x), r6=154(y), r7=38(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 223
LDI r1, 67
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 37
LDI r6, 154
LDI r7, 38
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
