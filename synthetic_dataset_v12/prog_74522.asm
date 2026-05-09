; DESCRIPTION: Composite: Places a cyan 77x22 rectangle at position (409, 0) then Places a green dot at position (242, 163).
; PLAN: r0=409(x), r1=0(y), r2=77(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=163(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 409
LDI r1, 0
LDI r2, 77
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 163
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
