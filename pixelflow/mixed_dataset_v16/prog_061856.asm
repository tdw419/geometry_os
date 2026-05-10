; DESCRIPTION: Composite: Places a cyan dot at position (175, 190) then Places a orange line segment connecting (435, 133) to (422, 76).
; PLAN: r0=175(x), r1=190(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=435(x1), r6=133(y1), r7=422(x2), r8=76(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 175
LDI r1, 190
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 435
LDI r6, 133
LDI r7, 422
LDI r8, 76
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
