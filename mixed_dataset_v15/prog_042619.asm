; DESCRIPTION: Composite: Places a cyan 59x67 rectangle at position (266, 2) then Places a green dot at position (472, 159).
; PLAN: r0=266(x), r1=2(y), r2=59(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=472(x), r6=159(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 266
LDI r1, 2
LDI r2, 59
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 472
LDI r6, 159
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
