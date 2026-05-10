; DESCRIPTION: Composite: Places a green 67x92 rectangle at position (70, 97) then Places a green dot at position (294, 234).
; PLAN: r0=70(x), r1=97(y), r2=67(width), r3=92(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=234(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 70
LDI r1, 97
LDI r2, 67
LDI r3, 92
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 234
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
