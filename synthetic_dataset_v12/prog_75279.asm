; DESCRIPTION: Composite: Places a cyan 24x91 rectangle at position (41, 61) then Places a green dot at position (263, 18).
; PLAN: r0=41(x), r1=61(y), r2=24(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=18(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 41
LDI r1, 61
LDI r2, 24
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 18
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
