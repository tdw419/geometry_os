; DESCRIPTION: Composite: Places a white dot at position (152, 98) then Places a yellow 50x66 rectangle at position (278, 62).
; PLAN: r0=152(x), r1=98(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=62(y), r7=50(width), r8=66(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 152
LDI r1, 98
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 62
LDI r7, 50
LDI r8, 66
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
