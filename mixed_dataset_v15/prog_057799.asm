; DESCRIPTION: Composite: Places a green dot at position (242, 237) then Places a red 119x10 rectangle at position (116, 218).
; PLAN: r0=242(x), r1=237(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=116(x), r6=218(y), r7=119(width), r8=10(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 242
LDI r1, 237
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 116
LDI r6, 218
LDI r7, 119
LDI r8, 10
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
