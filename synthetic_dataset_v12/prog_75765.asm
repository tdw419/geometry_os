; DESCRIPTION: Composite: Places a yellow dot at position (400, 129) then Places a cyan 41x105 rectangle at position (401, 43).
; PLAN: r0=400(x), r1=129(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=401(x), r6=43(y), r7=41(width), r8=105(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 129
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 401
LDI r6, 43
LDI r7, 41
LDI r8, 105
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
