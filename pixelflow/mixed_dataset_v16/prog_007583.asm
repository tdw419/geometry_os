; DESCRIPTION: Composite: Creates a cyan circular shape at (198, 129) with radius 52 then Places a black 77x56 rectangle at position (410, 80).
; PLAN: r0=198(x), r1=129(y), r2=52(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=410(x), r6=80(y), r7=77(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 198
LDI r1, 129
LDI r2, 52
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 410
LDI r6, 80
LDI r7, 77
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
