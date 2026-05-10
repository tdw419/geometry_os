; DESCRIPTION: Composite: Places a green dot at position (203, 13) then Places a blue 18x73 rectangle at position (263, 48).
; PLAN: r0=203(x), r1=13(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=48(y), r7=18(width), r8=73(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 13
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 263
LDI r6, 48
LDI r7, 18
LDI r8, 73
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
