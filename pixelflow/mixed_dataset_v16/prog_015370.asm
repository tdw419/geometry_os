; DESCRIPTION: Composite: Renders a black line between points (294, 218) and (233, 234) then Renders a black box of size 27x11 starting at (206, 191).
; PLAN: r0=294(x1), r1=218(y1), r2=233(x2), r3=234(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=191(y), r7=27(width), r8=11(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 294
LDI r1, 218
LDI r2, 233
LDI r3, 234
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 191
LDI r7, 27
LDI r8, 11
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
