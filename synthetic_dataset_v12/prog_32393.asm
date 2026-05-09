; DESCRIPTION: Composite: Places a white 38x57 rectangle at position (112, 190) then Places a green dot at position (186, 55).
; PLAN: r0=112(x), r1=190(y), r2=38(width), r3=57(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=186(x), r6=55(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 112
LDI r1, 190
LDI r2, 38
LDI r3, 57
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 55
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
