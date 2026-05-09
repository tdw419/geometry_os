; DESCRIPTION: Composite: Places a white 99x43 rectangle at position (365, 91) then Places a cyan dot at position (328, 239).
; PLAN: r0=365(x), r1=91(y), r2=99(width), r3=43(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=328(x), r6=239(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 365
LDI r1, 91
LDI r2, 99
LDI r3, 43
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 328
LDI r6, 239
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
