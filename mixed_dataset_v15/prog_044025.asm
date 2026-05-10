; DESCRIPTION: Composite: Places a yellow dot at position (218, 22) then Places a black 83x86 rectangle at position (189, 34).
; PLAN: r0=218(x), r1=22(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=189(x), r6=34(y), r7=83(width), r8=86(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 218
LDI r1, 22
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 189
LDI r6, 34
LDI r7, 83
LDI r8, 86
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
