; DESCRIPTION: Composite: Places a green dot at position (459, 211) then Places a cyan 47x91 rectangle at position (439, 136).
; PLAN: r0=459(x), r1=211(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=439(x), r6=136(y), r7=47(width), r8=91(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 211
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 439
LDI r6, 136
LDI r7, 47
LDI r8, 91
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
