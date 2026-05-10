; DESCRIPTION: Composite: Places a blue dot at position (425, 13) then Places a black 107x66 rectangle at position (350, 117).
; PLAN: r0=425(x), r1=13(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=350(x), r6=117(y), r7=107(width), r8=66(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 425
LDI r1, 13
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 350
LDI r6, 117
LDI r7, 107
LDI r8, 66
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
