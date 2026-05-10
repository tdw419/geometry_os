; DESCRIPTION: Composite: Renders a cyan disk with center (97, 206) and radius 19 then Places a white 46x22 rectangle at position (330, 170).
; PLAN: r0=97(x), r1=206(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=330(x), r6=170(y), r7=46(width), r8=22(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 206
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 330
LDI r6, 170
LDI r7, 46
LDI r8, 22
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
