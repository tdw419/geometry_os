; DESCRIPTION: Composite: Places a cyan 41x71 rectangle at position (184, 115) then Places a green dot at position (25, 52).
; PLAN: r0=184(x), r1=115(y), r2=41(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=25(x), r6=52(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 184
LDI r1, 115
LDI r2, 41
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 25
LDI r6, 52
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
