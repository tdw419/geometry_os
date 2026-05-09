; DESCRIPTION: Composite: Renders a cyan line between points (294, 98) and (405, 227) then Renders a cyan box of size 37x105 starting at (442, 14).
; PLAN: r0=294(x1), r1=98(y1), r2=405(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=14(y), r7=37(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 98
LDI r2, 405
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 14
LDI r7, 37
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
