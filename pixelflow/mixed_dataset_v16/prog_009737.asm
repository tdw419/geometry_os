; DESCRIPTION: Composite: Renders a black box of size 99x54 starting at (336, 176) then Places a cyan dot at position (110, 117).
; PLAN: r0=336(x), r1=176(y), r2=99(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=110(x), r6=117(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 336
LDI r1, 176
LDI r2, 99
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 110
LDI r6, 117
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
